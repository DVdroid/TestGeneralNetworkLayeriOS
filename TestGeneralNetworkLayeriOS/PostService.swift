//
//  PostService.swift
//  TestGeneralNetworkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

import Foundation
import GeneralNetwotkLayeriOS

enum PostService: ServiceProtocol {

    case all
    case comments(postIt: Int)

    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }

    var path: String {
        switch self {
        case .all:
            return "posts"
        case .comments:
            return "comments"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var task: Task {
        switch self {
        case .all:
            return .requestPlain
        case let .comments(postId):
            let parameters = ["postId": postId]
            return .requestParameters(parameters)
        }
    }

    var headers: Headers? {
        return nil
    }

    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
