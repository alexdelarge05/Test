//
//  Constants.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation

struct Constants {
    static let baseUrl = "https://jsonplaceholder.typicode.com"  
    static let defaultTimeout: TimeInterval = 10.0
    static let defaultCahePolicy: URLRequest.CachePolicy = .reloadIgnoringCacheData
    static let stringLimit = 120
    
    enum Routes: String {
        case comments = "/comments"
    }
}
