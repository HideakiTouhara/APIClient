//
//  APIClientTests.swift
//  APIClientTests
//
//  Created by HideakiTouhara on 2019/09/15.
//  Copyright © 2019 HideakiTouhara. All rights reserved.
//

import XCTest
@testable import APIClient

class APIClientTests: XCTestCase {

    func testRequest() {
        let input: Request = (
            url: URL(string: "https://api.github.com/zen")!,
            queries: [],
            headers: [:],
            methodAndPayload: .get
        )
        WebAPI.call(with: input)
    }

    func testResponse() {
        let response: Response = (
            statusCode: .ok,
            headers: [:],
            payload: "this is a resonse text".data(using: .utf8)!
        )

        let errorOrZen = GithubZen.from(response: response)
        switch errorOrZen {
        case .left(let error):
            XCTFail("\(error)")
        case let .right(zen):
            XCTAssertEqual(zen.text, "this is a resonse text")
        }
    }

    func testRequestAndResponse() {
        let expectation = self.expectation(description: "Wait for API")

        let input: Request = (
            url: URL(string: "https://api.github.com/zen")!,
            queries: [],
            headers: [:],
            methodAndPayload: .get
        )

        WebAPI.call(with: input) { output in
            switch output {
            case let .noResponse(connectionError):
                XCTFail("\(connectionError)")
            case let .hasResponse(response):
                let errorOrZen = GithubZen.from(response: response)
                XCTAssertNotNil(errorOrZen.right)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10)
    }

}
