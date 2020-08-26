//
//  API.swift
//  TestCloud
//
//  Created by Алексей Петров on 23.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation
import Combine

struct API {
        
    struct Response {
        let value: Data
        let response: URLResponse
    }

    func request(_ request: URLRequest) -> AnyPublisher<Response, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap({ result -> Response in
                return Response(value: result.data, response: result.response)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
