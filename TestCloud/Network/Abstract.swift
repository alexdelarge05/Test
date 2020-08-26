//
//  Abstract.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation

protocol Route {
    var urlRequest: URLRequest { get }
    func ofType<T: Decodable>() -> T.Type
}

extension Route {
    func parce<T: Decodable>(_ data: Data) throws -> T {
        return try JSONDecoder().decode(ofType(), from: data)
    }
}

protocol Model {
    var id: UUID { get }
}
