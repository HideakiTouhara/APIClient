//
//  GitHubAPI.swift
//  APIClient
//
//  Created by HideakiTouhara on 2019/09/16.
//  Copyright © 2019 HideakiTouhara. All rights reserved.
//

import Foundation

enum Either<Left, Right> {
    case left(Left)
    case right(Right)

    var left: Left? {
        switch self {
        case .left(let left):
            return left
        case .right(_):
            return nil
        }
    }

    var right: Right? {
        switch self {
        case .left(_):
            return nil
        case .right(let right):
            return right
        }
    }
}

struct GithubZen {
    let text: String

    static func from(response: Response) -> Either<TransformError, GithubZen> {
        switch response.statusCode {
        case .ok:
            guard let string = String(data: response.payload, encoding: .utf8) else {
                return .left(.malformedData(debugInfo: "not UTF-8 string"))
            }
            return .right(.init(text: string))
        default:
            return .left(.unexpectedStatusCode(debugInfo: "\(response.statusCode)"))
        }
    }

    enum TransformError {
        case unexpectedStatusCode(debugInfo: String)
        case malformedData(debugInfo: String)
    }
}
