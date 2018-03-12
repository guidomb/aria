//
//  Repository.swift
//  AriaPackageDescription
//
//  Created by Guido Marucci Blas on 3/11/18.
//

import Foundation

public struct GitHubRepository: Decodable, AutoCodingKeys {

    public let id: UInt
    public let name: String
    public let full_name: String
    public let owner: GitHubUser
    public let `private`: Bool
    public let htmlUrl: URL
    public let description: String
    public let fork: Bool
    public let url: URL
    public let forksUrl: URL
    public let keysUrl: URL
    public let collaboratorsUrl: URL
    public let teamsUrl: URL
    public let hooksUrl: URL
    public let issueEventsUrl: URL
    public let eventsUrl: URL
    public let assigneesUrl: URL
    public let branchesUrl: URL
    public let tagsUrl: URL
    public let blobsUrl: URL
    public let gitTagsUrl: URL
    public let gitRefsUrl: URL
    public let treesUrl: URL
    public let statusesUrl: URL
    public let languagesUrl: URL
    public let stargazersUrl: URL
    public let contributorsUrl: URL
    public let subscribersUrl: URL
    public let subscriptionUrl: URL
    public let commitsUrl: URL
    public let gitCommitsUrl: URL
    public let commentsUrl: URL
    public let issueCommentUrl: URL
    public let contentsUrl: URL
    public let compareUrl: URL
    public let mergesUrl: URL
    public let archiveUrl: URL
    public let downloadsUrl: URL
    public let issuesUrl: URL
    public let pullsUrl: URL
    public let milestonesUrl: URL
    public let notificationsUrl: URL
    public let labelsUrl: URL
    public let releasesUrl: URL
    public let createdAt: Date
    public let updatedAt: Date
    public let pushedAt: Date
    public let gitUrl: URL
    public let sshUrl: URL
    public let cloneUrl: URL
    public let svnUrl: URL
    public let homepage: URL?
    public let size: UInt
    public let stargazersCount: UInt
    public let watchersCount: UInt
    public let language: String?
    public let hasIssues: Bool
    public let hasDownloads: Bool
    public let hasWiki: Bool
    public let hasPages: Bool
    public let forksCount: UInt
    public let mirrorUrl: URL?
    public let openIssuesCount: UInt
    public let forks: UInt
    public let openIssues: UInt
    public let watchers: UInt
    public let defaultBranch: String

}
