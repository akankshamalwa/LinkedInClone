//
//  ContentView.swift
//  Inspire_Challenge
//
//  Created by Akanksha Malwade on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: PostCardViewModel
    @State private var currentPage = 0
    let viewControllers: [UIHostingController<HomeScreenView>]
    let pageTitles = ["Posts(6)", "Posts(5)", "Posts(4)"]
    
    init() {
        viewControllers = pageTitles.map { _ in
            UIHostingController(rootView: HomeScreenView())
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Divider().opacity(0.3)
            searchBarView.offset(x: 20)
            Divider().opacity(0.3)
            pageTabView
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
                .frame(maxHeight: .infinity)
        }
    }
    
    // `pageTabView` displays a scrollable tab view with page titles.
    var pageTabView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                ForEach(pageTitles.indices, id: \.self) { index in
                    PageTitleView(title: pageTitles[index], isSelected: index == currentPage)
                        .onTapGesture {
                            currentPage = index
                        }
                }
            }
        }
    }
    
    // `searchBarView` displays a search bar and a cancel button.
    var searchBarView: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: 270, height: 30)
                .overlay(
                    HStack {
                        Image("SearchBold")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Search")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        Spacer()
                    }.padding()
                )
            
            Button {
                // NO OP
            } label: {
                Text("Cancel")
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 20)
            }
        }
    }
}

/**
 `PageTitleView` represents a view for displaying page titles in the tab view.
 */
struct PageTitleView: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(isSelected ? .blue : .gray)
                .padding()
            ZStack {
                Divider()
                    .frame(width: 120)
                if isSelected {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PostCardViewModel())
    }
}
