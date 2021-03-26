//
//  GetMovieDetailsResponse.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import Moya

enum GetMovieDetailsResponse {
    
    // API Errors
    case success(content: MovieDetails)
    case unauthorizedError(jsonString: String)
    case resourceNotFoundError(jsonString: String)
    
    // Response Errors
    case responseDataError(response: Moya.Response)
    case redirectionError(jsonString: String)
    case clientError(jsonString: String)
    case serverError(jsonString: String)
    case invalidResponseError(jsonString: String)
    
    // Request Errors
    case jsonDecodingError(jsonString: String)
    case requestFailureError(error: String)
    case requestOfflineError(error: String)
    case requestTimeOutError(error: String)
}
