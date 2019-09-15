//
//  WebAPI.swift
//  APIClient
//
//  Created by HideakiTouhara on 2019/09/15.
//  Copyright © 2019 HideakiTouhara. All rights reserved.
//

import Foundation

typealias Input = Request

typealias Request = (
    url: URL,
    queries: [URLQueryItem],
    headers: [String : String],
    methodAndPayload: HTTPMethodAndPayload
)

enum HTTPMethodAndPayload {
    case get
//    case post(payload: Data?)

    var method: String {
        switch self {
        case .get:
            return "GET"
        }
    }

    var body: Data? {
        switch self {
        case .get:
            return nil
        }
    }
}

enum WebAPI {
    static func call(with input: Input) {
        // TODO: laters
    }
}
