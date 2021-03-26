//
//  ProductionCompany.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

struct ProductionCompany: Codable {
    
    let name: String
    let id: Int
    let logoPath: String?
    let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

extension ProductionCompany {
    
    func getLogoPathImage() -> String? {
        
        guard let url = ApiCredentials.imageBaseUrl,
              let size = ApiCredentials.imageLogoSize,
              let path = logoPath else {
            return nil
        }
        
        return "\(url)\(size)\(path)"
    }
}
