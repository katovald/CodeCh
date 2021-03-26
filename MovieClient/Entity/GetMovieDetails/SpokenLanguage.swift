//
//  SpokenLanguage.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct SpokenLanguage: Codable {
    
    let iso6391: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case name = "name"
    }
}
