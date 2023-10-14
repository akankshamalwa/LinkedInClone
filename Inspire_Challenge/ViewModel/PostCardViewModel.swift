//
//  PostCardViewModel.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import Foundation

class PostCardViewModel: ObservableObject {
    @Published var model: [Post] = []
    
    init() {
        loadJsonModel()
    }
    
    func loadJsonModel() {
        // Check if the `JSON` file exists in the app's bundle
        if let url = Bundle.main.url(forResource: "ImportedData", withExtension: "json") {
            do {
                
                // Read data from the `JSON` file
                let data = try Data(contentsOf: url)
                
                // Decode `JSON` data into a `PostResponse` object using `JSONDecoder`
                let postResponse = try JSONDecoder().decode(PostResponse.self, from: data)
                
                // Set the model property to the decoded posts
                model = postResponse.posts
            } catch {
                
                // Handle any errors that occur during the process
                print("error:\(error)")
            }
        }
    }
}
