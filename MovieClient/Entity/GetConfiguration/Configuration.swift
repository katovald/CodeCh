//
//  Configuration.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct Configuration: Codable {
    
    let changeKeys: [String]
    let images: ConfigurationItem
    
    enum CodingKeys: String, CodingKey {
        case changeKeys = "change_keys"
        case images = "images"
    }
}
