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

}
