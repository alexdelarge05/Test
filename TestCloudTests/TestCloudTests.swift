//
//  TestCloudTests.swift
//  TestCloudTests
//
//  Created by Алексей Петров on 26.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import XCTest

class TestCloudTests: XCTestCase {

    func bodyClipTest() {
        let body = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount != nil)
    }
    
    func bodyCountTest() {
        let body = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit... Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount != nil, "body count must be")
    }

}
