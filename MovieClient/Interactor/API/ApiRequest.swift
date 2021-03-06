//
//  ApiRequest.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import Foundation
import Reachability
import Moya
import Result

typealias ApiRequestCallback = (_ response: ApiResponse) -> Void

class ApiRequest {
    
    private init() {}
    
    static func request(to endpoint: ApiEndpoint, completion callback: @escaping ApiRequestCallback) {
        
        // Here we perform the first Internet connection testing
        let host = "\(endpoint.baseURL)\(endpoint.path)"
            if let reach = try? Reachability(hostname: host), reach.connection == .unavailable {
                
                // Only for debugging
                ApiUtils.printNoInternet(using: endpoint)
                
                // WiFi ans Cellular connections are off
                callback(.offline(error: "No WiFi or Cellular connection available"))
                return
            }
        
        // Operations before sending a request can be added here
        var plugins = [PluginType]()
        
        // Only for debugging
        if BuildConfiguration.isNotRelease {
            plugins.append(PrintRequest())
        }
        
        // Here we perform the request
        let provider: MoyaProvider<ApiEndpoint>
        
        if Test.isTesting() {
            provider = MoyaProvider<ApiEndpoint>.init(stubClosure: MoyaProvider.delayedStub(0.5), plugins: plugins)
        } else {
            provider = MoyaProvider<ApiEndpoint>(plugins: plugins)
        }
        
        provider.request(endpoint) { result in
            
            // Only for debugging
            ApiUtils.printResponse(result, endpoint: endpoint)
            
            switch result {
                
            case .success(let data):
                callback(.success(result: data))
                
            case .failure(let requestError):
                
                // Let's determine if the failure was caused by a internet connectivity issue
                switch requestError {
                    
                // Indicates a response failed due to an underlying `Error`
                case .underlying(let swiftError as NSError, _):
                    
                    switch swiftError.code {
                        
                    case -1001: // Reason: The request timed out
                        callback(.timeOut(error: requestError.localizedDescription))
                        return
                        
                    case -1009: // Reason: The Internet connection appears to be offline
                        callback(.offline(error: requestError.localizedDescription))
                        return
                        
                    default:
                        break
                    }
                default:
                    break
                }
                
                callback(.failure(error: requestError.localizedDescription))
            }
        }
    }
}

// MARK: Plugin for Logging
struct PrintRequest: PluginType {
    
    /// Called immediately before a request is sent over the network (or stubbed).
    func willSend(_ request: RequestType, target: TargetType) {
        ApiUtils.print(request: request.request!)
    }
}
