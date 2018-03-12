//
//  User.swift
//  AriaPackageDescription
//
//  Created by Guido Marucci Blas on 3/11/18.
//

import Foundation

public struct GitHubUser: Decodable, AutoCodingKeys {

    public let login: String
    public let id: UInt
    public let avatarUrl: URL
    public let gravatarId: String
    public let url: URL
    public let htmlUrl: URL
    public let followersUrl: URL
    public let followingUrl: URL
    public let gistsUrl: URL
    public let starredUrl: URL
    public let subscriptionsUrl: URL
    public let organizationsUrl: URL
    public let reposUrl: URL
    public let eventsUrl: URL
    public let receivedEventsUrl: URL
    public let type: String
    public let siteAdmin: Bool

}
