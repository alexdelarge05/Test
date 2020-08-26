//
//  Models.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation

struct CommentResponce: Decodable {
    var name: String
    var email: String
    var body: String
}

struct CommentRoute: Route {
    var urlRequest: URLRequest
    
    init() {
        urlRequest = URLRequest(route: .comments)
    }
    
    func ofType<T>() -> T.Type where T : Decodable {
        return [CommentResponce].self as! T.Type
    }
}

public class Comment: Model {
    var id: UUID
    var name: String
    var email: String
    var body: String
    var bodyCount: Int?
    
    init(name: String, email: String, body: String) {
        id = UUID()
        self.name = name
        self.email = email
        self.body = body.count > Constants.stringLimit ? "\(body.prefix(Constants.stringLimit))" : body
        bodyCount = body.count > Constants.stringLimit ? body.count : nil
    }
    
    convenience init(responce: CommentResponce) {
        self.init(
            name: responce.name,
            email: responce.email,
            body: responce.body
        )
    }
}
