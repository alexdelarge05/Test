//
//  File.swift
//  TestCloud
//
//  Created by Алексей Петров on 23.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation
import Combine

struct JSONPlaceholder {
    private static let api = API()
    static func request<T: Decodable>(_ route: Route) -> AnyPublisher<T, Error> {
        return api.request(route.urlRequest)
            .tryMap({try route.parce($0.value)})
            .eraseToAnyPublisher()
    }
}


class Comments {
    typealias CommentsHandler = (Result<[Comment], Error>) -> Void
    static var shared = Comments()
    
    private var commentsResponce: [CommentResponce] = [] {
        didSet {
            handle(
                comments: commentsResponce
                .map({Comment(responce: $0)})
            )
        }
    }
    
    private var cancelebe: AnyCancellable?
    private var handler: CommentsHandler?
    
    func fetch(_ result: @escaping CommentsHandler) {
        handler = result
        cancelebe = JSONPlaceholder.request(CommentRoute())
            .mapError({ (error) -> Error in
                debugPrint(error.localizedDescription)
                result(.failure(error))
                return error
            })
            .sink(receiveCompletion: { (_) in
                
            }, receiveValue: { (comments) in
                self.commentsResponce = comments
            })
    }
    
    private func handle(comments: [Comment]) {
        guard let handler = handler else { return }
        handler(.success(comments))
    }
}
