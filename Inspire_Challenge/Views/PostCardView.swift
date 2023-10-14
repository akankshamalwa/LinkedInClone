//
//  PostCardView.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import SwiftUI

/**
 `PostCardView` represents a view for displaying a post card.
 */
struct PostCardView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            actorDetailView
            descriptionView
            socialActionView
        }
    }
    
    // `ActorDetailView` displays the post author's details.
    var actorDetailView: some View {
        HStack(alignment: .center, spacing: 5) {
            Image("GenericUser")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .background()
                .frame(width:30, height: 30)
            VStack(alignment: .leading, spacing: 5) {
                Text(post.author.nickname)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(post.created)
                    .font(.subheadline)
                    .opacity(0.4)
            }
        }
    }
    
    // `DescriptionView` displays the post title and content.
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(post.title)
                .font(.title)
                .fontWeight(.bold)
            Text(post.content)
                .font(.title3)
        }
    }
    
    // `SocialActionView` displays social actions and reactions.
    var socialActionView: some View {
        HStack(alignment: .center, spacing: 10) {
            ReactionView(reactionImage: "Union", reactionName: "10 Replies")
            ReactionView(reactionImage: "share", reactionName: "Share")
            ReactionView(reactionImage: "ReactIcon", reactionName: "React")
            
            HStack(alignment: .center, spacing: 5) {
                Button {
                    // NO OP
                } label: {
                    Image("Reactions")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 30)
                }
                Text("3")
                    .font(.subheadline)
            }
        }
    }
}

/**
 `ReactionView` represents a view for displaying a reaction
 .*/
struct ReactionView: View {
    let reactionImage: String
    let reactionName: String
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Button {
                // NO OP
            } label: {
                Image(reactionImage)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
            }
            Text(reactionName)
                .font(.subheadline)
        }
    }
}
