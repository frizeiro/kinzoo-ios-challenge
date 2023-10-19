//
//  StubbedTestCase.swift
//  RnMUniverseTests
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation
import XCTest
import OHHTTPStubs

@testable import RnMUniverse

open class StubbedTestCase : XCTestCase {
    
    open override func tearDown() {
        HTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
}

extension StubbedTestCase {
    
    func stub(
        _ request: Request,
        status code: Int = 200,
        fileName: String? = nil
    ) {
        var mockName = request.path.split(separator: "/").map {
            String(describing: $0).capitalizingFirstLetter()
        }.joined()
        mockName = "Request\(mockName)_Mock"
        
        let data = Mocks.loadData(fileName ?? mockName)
        
        OHHTTPStubs.stub(condition: isRequest(request)) { _ in
            return HTTPStubsResponse(data: data, statusCode:Int32(code), headers: nil)
        }
    }
    
    func stubEmpty(
        _ request: Request,
        status code: Int = 204,
        fileName: String? = nil
    ) {
        stub(request, status: code, fileName: fileName ?? "Empty_Mock.json")
    }
    
}

private func isRequest(_ request: Request) -> HTTPStubsTestBlock {
    return { req in
        req.url?.path == "/api/\(request.path)"
    }
}
