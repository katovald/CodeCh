//
//  PopularMovies.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct PopularMovies: Codable {
    
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [MovieResult]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}
