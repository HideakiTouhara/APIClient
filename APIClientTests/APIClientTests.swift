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
            methodAndPayload: HTTPMethodAndPayload.get
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

}
