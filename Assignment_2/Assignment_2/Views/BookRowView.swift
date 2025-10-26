//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Caitlin Hendricks on 10/25/25.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(book.bookTitle)
                    .font(.headline)
                Text(book.bookAuthor)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    BookRowView(book: BookModel(id : 1, bookTitle: "To Kill a Mockingbird", bookAuthor: "Harper Lee"))
}
