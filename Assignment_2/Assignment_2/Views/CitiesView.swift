//
// CitiesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//
// Modified by Caitlin Hendricks on 10/25/25.
//


import SwiftUI

struct CitiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    var showFavesOnly: Bool = false     // flag to show only saved favorites
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(showCities) { city in
                    CityCardView(city: city)
                }
            }
            .padding()
        }
    }
    
    // helper function to allow HomeView to show all items and FavoritesView to show only favorited items
    private var showCities: [CityModel] {
        if showFavesOnly {
            return favorites.favoritedCities(searchText: searchText)
        } else {
            return favorites.filteredCities(searchText: searchText)
        }
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
