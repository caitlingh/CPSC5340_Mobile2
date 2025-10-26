//
//  BooksView.swift
//  Favorites_Completed
//
//  Created by Caitlin Hendricks on 10/25/25.
//

import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    var showFavesOnly: Bool = false     // flag to show only saved favorites

    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(showBooks) { book in
                    BookRowView(book: book)
                }
            }
            .padding()
        }
    }
    
    // helper function to allow HomeView to show all items and FavoritesView to show only favorited items
    private var showBooks: [BookModel] {
        if showFavesOnly {
            return favorites.favoritedBooks(searchText: searchText)
        } else {
            return favorites.filteredBooks(searchText: searchText)
        }
    }
}

#Preview {
    BooksView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
