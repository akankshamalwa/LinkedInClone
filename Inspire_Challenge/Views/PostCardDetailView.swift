//
//  PostCardDetailView.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import SwiftUI

/**
 `PostCardDetailView` represents a view for displaying detailed information about a post.
 */
struct PostCardDetailView: View {
    
    // Binding to control the presentation of this view
    @Binding var isPresented: Bool
    
    // The post to be displayed in detail
    let post: Post
    var body: some View {
        NavigationView {
            VStack {
                Divider().opacity(0.3)
                
                // Display the post details using PostCardView
                PostCardView(post: post)
                Divider()
                    .frame(width: 350)
                Spacer()
            }
            
            // Display the navigation bar
            .navigationBarHidden(false)
            .navigationBarItems(
                leading: Button(action: {
                    
                    // Toggle the isPresented binding to dismiss this view
                    isPresented.toggle()
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20, height: 20)
                })
        }
    }
}

