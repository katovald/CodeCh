//
//  GetMovieDetailsInteractor.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import Moya
import RxSwift

// MARK: Public
class GetMovieDetailsInteractor {
    
    let bindResponse = PublishSubject<GetMovieDetailsResponse>()
    
    func request(movieId: Int) {
        
        let endpoint = ApiEndpoint.getMovieDetails(movieId: movieId)
        
        ApiRequest.request(to: endpoint) { [weak self] response in
            guard let `self` = self else { return }
            
            switch response {
                
            case .success(let result):
                self.process(result)
                
            case .failure(let error):
                self.sendResponse(.requestFailureError(error: error))
                
            case .offline(let error):
                self.sendResponse(.requestOfflineError(error: error))
                
            case .timeOut(let error):
                self.sendResponse(.requestTimeOutError(error: error))
            }
        }
    }
}

// MARK: Internals
extension GetMovieDetailsInteractor {
    
    private func process(_ result: Response) {
        
        let code = result.statusCode
        
        // Convert raw data into a json string
        guard let jsonString = ApiUtils.getJsonString(from: result) else {
            sendResponse(.responseDataError(response: result))
            return
        }
        
        // HTTP status code validation
        switch code {
        case 200:
            process(jsonString)
            
        case 401, 403:
            sendResponse(.unauthorizedError(jsonString: jsonString))
            
        case 404:
            sendResponse(.resourceNotFoundError(jsonString: jsonString))
            
        case 300...399:
            sendResponse(.redirectionError(jsonString: jsonString))
            
        case 400...499:
            sendResponse(.clientError(jsonString: jsonString))
            
        case 500...599:
            sendResponse(.serverError(jsonString: jsonString))
            
        default:
            sendResponse(.invalidResponseError(jsonString: jsonString))
        }
    }
    
    private func process(_ jsonString: String) {
        
        // Converts the jsonString into a valid Object
        guard let content: MovieDetails = jsonString.decodeFrom() else {
            sendResponse(.jsonDecodingError(jsonString: jsonString))
            return
        }
        
        // Returns the parsed object
        sendResponse(.success(content: content))
    }
    
    private func sendResponse(_ result: GetMovieDetailsResponse) {
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            
            self.bindResponse.onNext(result)
        }
    }
}
