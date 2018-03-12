//
//  Request.swift
//  AriaPackageDescription
//
//  Created by Guido Marucci Blas on 3/11/18.
//
import Foundation

public struct GitHubWebhookRequest {
    
    public let event: GitHubWebhookEvent
    public let deliveryId: String
    public let signature: String
    
    public init(event: GitHubWebhookEvent, deliveryId: String, signature: String) {
        self.event = event
        self.deliveryId = deliveryId
        self.signature = signature
    }
    
}

public enum GitHubWebhookEvent: String {
    
    case commitComment = "commit_comment"
    case create = "create"
    case delete = "delete"
    case deployment = "deployment"
    case deploymentStatus = "deployment_status"
    case download = "download"
    case follow = "follow"
    case fork = "fork"
    case forkApply = "fork_apply"
    case gist = "gist"
    case gollum = "gollum"
    case installation = "installation"
    case installationRepositories = "installation_repositories"
    case issueComment = "issue_comment"
    case issues = "issues"
    case label = "label"
    case marketplacePurchase = "marketplace_purchase"
    case member = "member"
    case membership = "membership"
    case milestone = "milestone"
    case organization = "organization"
    case orgBlock = "org_block"
    case pageBuild = "page_build"
    case projectCard = "project_card"
    case projectColumn = "project_column"
    case project = "project"
    case `public` = "public"
    case pullRequest = "pull_request"
    case pullRequestReview = "pull_request_review"
    case pullRequestReviewComment = "pull_request_review_comment"
    case push = "push"
    case release = "release"
    case repository = "repository"
    case status = "status"
    case team = "team"
    case teamAdd = "team_add"
    case watch = "watch"
    
}
