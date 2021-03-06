//
//  MovieDetails.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct MovieDetails: Codable {
    
    let id: Int
    let title: String
    let overview: String?
    let popularity: Float
    let releaseDate: String
    let genres: [Genre]
    let originalTitle: String
    let originalLanguage: String
    let posterPath: String?
    let backdropPath: String?
    let voteCount: Int
    let voteAverage: Float
    let video: Bool
    let adult: Bool
    let homepage: String?
    let imdbId: String?
    let budget: Int
    let revenue: Int
    let runtime: Int?
    let status: String
    let tagline: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let spokenLanguages: [SpokenLanguage]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case genres = "genres"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case video = "video"
        case adult = "adult"
        case homepage = "homepage"
        case imdbId = "imdb_id"
        case budget = "budget"
        case revenue = "revenue"
        case runtime = "runtime"
        case status = "status"
        case tagline = "tagline"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
    }
}

extension MovieDetails {
    
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
