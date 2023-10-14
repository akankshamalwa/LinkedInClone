//
//  PostCardModel.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import SwiftUI

struct PostResponse: Codable {
    let posts: [Post]
}

struct Post: Codable, Identifiable {
    let id: String
    let trackingId: String
    let slug: String
    let author: Author
    let url: String
    let title: String
    let content: String
    let created: String
    let updated: String
    let reactions: [Reaction]
    let isFollowed: Bool
    let replyCountNonDeleted: Int
}

struct Author: Codable {
    let nickname: String
    let avatar: Avatar
}

struct Avatar: Codable {
    let small: String
}

struct Reaction: Codable {
    let type: String
    let count: Int
    let reacted_by_me: Bool
    let users: String
}
