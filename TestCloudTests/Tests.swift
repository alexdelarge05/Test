//
//  Tests.swift
//  TestCloudTests
//
//  Created by Алексей Петров on 26.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import XCTest

class Tests: XCTestCase {

    func testBodyClip()  {
        let body = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m" //100 symbols
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount == nil)
    }
    
    func testBodyCount()  {
        let body = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma" //140 symbols
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount != nil, "body count must be")
    }

    func testBodyRightCount()  {
        let body = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma" //140 symbols
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount == body.count, "wrong count")
    }
    
    func testLimits() {
        let body = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis nat" //120 symbols
        let comment = Comment(name: "Tester", email: "tester@me.com", body: body)
        XCTAssert(comment.bodyCount == nil)
    }

}
