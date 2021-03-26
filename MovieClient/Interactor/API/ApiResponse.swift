//
//  ApiResponse.swift
//  MovieClient
//
//  Created by Jose Valdez. 
//

import Moya

enum ApiResponse {
    case success(result: Response)
    case failure(error: String)
    case offline(error: String)
    case timeOut(error: String)
}
