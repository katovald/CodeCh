//
//  MovieCatalogState.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

enum MovieCatalogState {
    case noData
    case fetchingData
    case dataAvailable(movies: [MovieResult])
    case noInternet
    case error(key: LanguageKey)
}
