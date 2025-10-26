//
// HobbiesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//
// Modified by Caitlin Hendricks on 10/25/25.
//


import SwiftUI

struct HobbiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    var showFavesOnly: Bool = false     // flag to show only saved favorites

    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(showHobbies) { hobby in
                    HobbyRowView(hobby: hobby)
                }
            }
            .padding()
        }
    }
    
    // helper function to allow HomeView to show all items and FavoritesView to show only favorited items
    private var showHobbies: [HobbyModel] {
        if showFavesOnly {
            return favorites.favoritedHobbies(searchText: searchText)
        } else {
            return favorites.filteredHobbies(searchText: searchText)
        }
    }
}

#Preview {
    HobbiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
