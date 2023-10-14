//
//  Inspire_ChallengeApp.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import SwiftUI

@main
struct Inspire_ChallengeApp: App {
    
    // Initialize the view model
    @StateObject private var viewModel = PostCardViewModel()
    var body: some Scene {
        WindowGroup {
            
            // Provide the view model as an environment object
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
