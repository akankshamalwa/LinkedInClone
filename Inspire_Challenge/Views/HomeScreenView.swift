//
//  HomeScreenView.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 14/10/23.
//

import SwiftUI

/**
 `HomeScreenView` represents the main view of your app's home screen.
 */
struct HomeScreenView: View {
    
    // Access to the view model
    @EnvironmentObject private var viewModel: PostCardViewModel
    
    // State variable to control view presentation
    @State private var isPresented: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            // Display a list of post cards
            tabView
        }
        .padding()
    }
    
    // tabView displays a list of post cards using a ForEach loop.
    var tabView: some View {
        List {
            ForEach(viewModel.model) { post in
                PostCardView(post: post)
                    .onTapGesture {
                        
                        // Toggle the isPresented state to present the detailed view
                        isPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        PostCardDetailView(isPresented: $isPresented, post: post)
                    }
            }
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

/**
 `HomeScreenView_Previews` is for providing a preview of the HomeScreenView.
 */
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(PostCardViewModel())
    }
}
