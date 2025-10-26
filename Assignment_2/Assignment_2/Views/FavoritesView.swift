//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//
// Modified by Caitlin Hendricks on 10/25/25.
//


import SwiftUI

struct FavoritesView: View {
    
    @State private var selectedCategory: ContentCategory = .cities
    @State private var searchText: String = ""
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
                
            }
            .navigationTitle("Favorites")
            .searchable(text: $searchText, prompt: "Search \(selectedCategory.rawValue)")
        }
    }
    
        @ViewBuilder
        private func selectedContentView() -> some View {
            if selectedCategory == .cities {
                CitiesView(searchText: $searchText, showFavesOnly: true)
            } else if selectedCategory == .hobbies {
                HobbiesView(searchText: $searchText, showFavesOnly: true)
            } else if selectedCategory == .books {
                BooksView(searchText: $searchText, showFavesOnly: true)
            }
        }
    
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
