//
//  Extentions.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation

extension URLRequest {
    init(route: Constants.Routes) {
        self.init(
            url: URL(string: Constants.baseUrl)!.appendingPathComponent(route.rawValue),
            cachePolicy: Constants.defaultCahePolicy,
            timeoutInterval: Constants.defaultTimeout
        )
    }
}
