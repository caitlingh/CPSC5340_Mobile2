//
// FavoritesViewModel.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//
// Modified by Caitlin Hendricks on 10/25/25.
//


import Foundation
import SwiftUI

class FavoritesViewModel : ObservableObject {
    
    @Published var cities: [CityModel] = sampleCities
    @Published var hobbies: [HobbyModel] = sampleHobbies
    @Published var books: [BookModel] = sampleBooks
    
    private let cityManager = CategoryManager<CityModel>(storageKey: "favoriteCities")
    private let hobbyManager = CategoryManager<HobbyModel>(storageKey: "favoriteHobbies")
    private let bookManager = CategoryManager<BookModel>(storageKey: "favoriteBooks")
    
    init() {
        cities = cityManager.initializeFavorites(items: sampleCities)
        hobbies = hobbyManager.initializeFavorites(items: sampleHobbies)
        books = bookManager.initializeFavorites(items: sampleBooks)
    }
    
    func filteredCities(searchText: String) -> [CityModel] {
        cityManager.filteredItems(items: cities, searchText: searchText)
    }
    
    func toggleFavoriteCity(city: CityModel) {
        cityManager.toggleFavorite(items: &cities, targetItem: city)
    }
    
    func filteredHobbies(searchText: String) -> [HobbyModel] {
        hobbyManager.filteredItems(items: hobbies, searchText: searchText)
    }
    
    func toggleFavoriteHobby(hobby: HobbyModel) {
        hobbyManager.toggleFavorite(items: &hobbies, targetItem: hobby)
    }
    
    func filteredBooks(searchText: String) -> [BookModel] {
        bookManager.filteredItems(items: books, searchText: searchText)
    }
    
    func toggleFavoriteBook(book: BookModel) {
        bookManager.toggleFavorite(items: &books, targetItem: book)
    }
    
    func clearAllFavorites() {
        cityManager.clearFavorites(items: &cities)
        hobbyManager.clearFavorites(items: &hobbies)
        bookManager.clearFavorites(items: &books)
    }

    func favoritedCities(searchText: String) -> [CityModel] {
        let favoriteIds = cityManager.loadFavoriteIds()
        let favorites = cities.filter { favoriteIds.contains($0.id) }
        return cityManager.filteredItems(items: favorites, searchText: searchText)
    }

    func favoritedHobbies(searchText: String) -> [HobbyModel] {
        let favoriteIds = hobbyManager.loadFavoriteIds()
        let favorites = hobbies.filter { favoriteIds.contains($0.id) }
        return hobbyManager.filteredItems(items: favorites, searchText: searchText)
    }

    func favoritedBooks(searchText: String) -> [BookModel] {
        let favoriteIds = bookManager.loadFavoriteIds()
        let favorites = books.filter { favoriteIds.contains($0.id) }
        return bookManager.filteredItems(items: favorites, searchText: searchText)
    }
    
}

let sampleCities: [CityModel] = [

    CityModel(id : 1, cityName: "Cape Town", cityImage: "capetown", isFavorite: false),
    CityModel(id : 2, cityName: "Copenhagen", cityImage: "copenhagen", isFavorite: false),
    CityModel(id : 3, cityName: "Lisbon", cityImage: "lisbon", isFavorite: false),
    CityModel(id : 4, cityName: "Reykjavik", cityImage: "reykjavik", isFavorite: false),
    CityModel(id : 5, cityName: "Warsaw", cityImage: "warsaw", isFavorite: false),
    CityModel(id : 6, cityName: "London", cityImage: "london", isFavorite: false),
    CityModel(id : 7, cityName: "Monaco", cityImage: "monaco", isFavorite: false),
    CityModel(id : 8, cityName: "Amsterdam", cityImage: "amsterdam", isFavorite: false),
    CityModel(id : 9, cityName: "Los Angeles", cityImage: "losangeles", isFavorite: false)
]


let sampleHobbies: [HobbyModel] = [
    HobbyModel(id : 1, hobbyName: "Painting", hobbyIcon: "🎨", isFavorite: false),
    HobbyModel(id : 2, hobbyName: "Photography", hobbyIcon: "📷", isFavorite: false),
    HobbyModel(id : 3, hobbyName: "Guitar", hobbyIcon: "🎸", isFavorite: false),
    HobbyModel(id : 4, hobbyName: "Yoga", hobbyIcon: "🧘‍♀️", isFavorite: false),
    HobbyModel(id : 5, hobbyName: "Gardening", hobbyIcon: "🪴", isFavorite: false),
    HobbyModel(id : 6, hobbyName: "Cooking", hobbyIcon: "🍳", isFavorite: false),
    HobbyModel(id : 7, hobbyName: "Hiking", hobbyIcon: "🥾", isFavorite: false),
    HobbyModel(id : 8, hobbyName: "Writing", hobbyIcon: "✍️", isFavorite: false),
    HobbyModel(id : 9, hobbyName: "Dancing", hobbyIcon: "💃", isFavorite: false),
    HobbyModel(id : 10, hobbyName: "Knitting", hobbyIcon: "🧶", isFavorite: false),
    HobbyModel(id : 11, hobbyName: "Gaming", hobbyIcon: "🎮", isFavorite: false),
    HobbyModel(id : 12, hobbyName: "Calligraphy", hobbyIcon: "✒️", isFavorite: false),
]

let sampleBooks: [BookModel] = [
    BookModel(id : 1, bookTitle: "To Kill a Mockingbird", bookAuthor: "Harper Lee", isFavorite: false),
    BookModel(id : 2, bookTitle: "1984", bookAuthor: "George Orwell", isFavorite: false),
    BookModel(id : 3, bookTitle: "Pride and Prejudice", bookAuthor: "Jane Austen", isFavorite: false),
    BookModel(id : 4, bookTitle: "The Great Gatsby", bookAuthor: "F. Scott Fitzgerald", isFavorite: false),
    BookModel(id : 5, bookTitle: "The Catcher in the Rye", bookAuthor: "J.D. Salinger", isFavorite: false),
    BookModel(id : 6, bookTitle: "The Hobbit", bookAuthor: "J.R.R. Tolkien", isFavorite: false),
    BookModel(id : 7, bookTitle: "Fahrenheit 451", bookAuthor: "Ray Bradbury", isFavorite: false),
    BookModel(id : 8, bookTitle: "Jane Eyre", bookAuthor: "Charlotte Brontë", isFavorite: false),
    BookModel(id : 9, bookTitle: "The Alchemist", bookAuthor: "Paulo Coelho", isFavorite: false),
    BookModel(id : 10, bookTitle: "The Book Thief", bookAuthor: "Markus Zusak", isFavorite: false),
    BookModel(id : 11, bookTitle: "Moby-Dick", bookAuthor: "Herman Melville", isFavorite: false),
    BookModel(id : 12, bookTitle: "Crime and Punishment", bookAuthor: "Fyodor Dostoevsky", isFavorite: false)
]
