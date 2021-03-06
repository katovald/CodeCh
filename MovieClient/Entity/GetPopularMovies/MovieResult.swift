//
//  MovieResult.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct MovieResult: Codable {
    
    let id: Int
    let title: String
    let overview: String
    let popularity: Float
    let releaseDate: String
    let genreIds: [Int]
    let originalTitle: String
    let originalLanguage: String
    let posterPath: String?
    let backdropPath: String?
    let voteCount: Int
    let voteAverage: Float
    let video: Bool
    let adult: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case video = "video"
        case adult = "adult"
    }
}

extension MovieResult {
    
    func getPosterPathImage() -> String? {
        
        guard let url = ApiCredentials.imageBaseUrl,
              let size = ApiCredentials.imagePosterSize,
              let path = posterPath else {
            return nil
        }
        
        return "\(url)\(size)\(path)"
    }
    
    func getBackdropPathImage() -> String? {

        guard let url = ApiCredentials.imageBaseUrl,
              let size = ApiCredentials.imageBackdropSize,
              let path = backdropPath else {
            return nil
        }
        
        return "\(url)\(size)\(path)"
    }
}
