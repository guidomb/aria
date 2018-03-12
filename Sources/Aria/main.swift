import Foundation
import AriaKit
import Kitura
import Curry
import Runes
import CryptoSwift

let router = Router()
let port: Int = 8080
let githubSecret = "iloveswift"

extension GitHubWebhookRequest {
    
    static func parse(from request: RouterRequest) -> GitHubWebhookRequest? {
        return curry(GitHubWebhookRequest.init)
            <^> request.headers["X-GitHub-Event"].flatMap { GitHubWebhookEvent(rawValue: $0) }
            <*> request.headers["X-GitHub-Delivery"]
            <*> request.headers["X-Hub-Signature"]
    }
    
    func validateSignature(for data: Data, withKey key: String) -> Bool {
        guard let signature = try? HMAC(key: key, variant: .sha1).authenticate(data.bytes) else {
            return false
        }
        return "sha1=\(signature.toHexString())" == self.signature
    }
    
}


router.post("/") { request, response, next in
    guard let contentType = request.headers["Content-Type"] else {
        response.status(.badRequest)
        response.send("Missing Content-Type header")
        return
    }
    guard contentType == "application/json" else {
        response.status(.badRequest)
        response.send("Invalid Content-Type '\(contentType)'")
        return
    }
    
    // Read raw request body to calculate HMAC
    var requestBody = Data()
    do {
        let bodySize = try request.read(into: &requestBody)
        guard bodySize > 0 else {
            response.status(.badRequest)
            response.send("Request body is empty")
            return
        }
    } catch {
        response.status(.badRequest)
        response.send("Unable to read request body")
        return
    }
    
    guard let githubRequest = GitHubWebhookRequest.parse(from: request) else {
        response.status(.badRequest)
        response.send("Invalid GitHub request: Missing Headers")
        return
    }
    guard case .some(let userAgent) = request.headers["User-Agent"] else {
        response.status(.badRequest)
        response.send("Missing User-Agent header")
        return
    }
    guard userAgent.starts(with: "GitHub-Hookshot/") else {
        response.status(.badRequest)
        response.send("Invalid User-Agent header '\(userAgent)'")
        return
    }
    guard githubRequest.validateSignature(for: requestBody, withKey: githubSecret) else {
        response.status(.badRequest)
        response.send("Invalid HMAC signature")
        return
    }
    
    switch githubRequest.event {

    case .pullRequest:
        do {
            let pullRequestEvent = try JSONDecoder().decode(GitHubPullRequestEvent.self, from: requestBody)
        } catch let error {
            response.status(.badRequest)
            response.send("Unable to parse payload. Invalid pull request payload format: \(error)")
            return
        }

    default:
        print("Unsupported GitHub webhook event '\(githubRequest.event.rawValue)'")

    }
}


print("Running server in port \(port)")
Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
