//
//  GetPopularMoviesEmptyTest.swift
//  MovieClientTests
//
//  Created by Jose Valdez. 
//

import XCTest
@testable import MovieClient

class GetPopularMoviesEmptyTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Test.enableTestingMode()
        Test.setEndpointResult(fromFile: .getPopularMoviesEmpty)
    }
    
    func testRequest() {
        
        let expectation = XCTestExpectation(description: "ApiEndpoint.getPopularMovies")
        let endpoint = ApiEndpoint.getPopularMovies(page: 0)
        
        ApiRequest.request(to: endpoint) { response in
            
            switch response {
                
            case .success(let result):
                guard let jsonString = ApiUtils.getJsonString(from: result) else {
                    XCTFail("Error when converting Data object into Json string")
                    return
                }
                XCTAssertEqual(jsonString, "")
                
            default:
                XCTFail("Invalid response case")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: Test.expectationTimeout)
    }
}
