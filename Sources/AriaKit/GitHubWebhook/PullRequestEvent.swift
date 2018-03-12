//
//  PullRequestEvent.swift
//  AriaPackageDescription
//
//  Created by Guido Marucci Blas on 3/11/18.
//
import Foundation

public struct GitHubPullRequestEvent: Decodable {
    
    public enum Action: String, Decodable {
        
        case assigned = "assigned"
        case unassigned = "unassigned"
        case reviewRequested = "review_requested"
        case reviewRequestRemoved = "review_request_removed"
        case labeled = "labeled"
        case unlabeled = "unlabeled"
        case opened = "opened"
        case edited = "edited"
        case closed = "closed"
        case reopened = "reopened"
    }
    
    public let sender: GitHubUser
    public let repository: GitHubRepository
    public let action: GitHubPullRequestEvent.Action
    public let number: UInt
    
}
