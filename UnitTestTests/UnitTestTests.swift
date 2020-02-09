//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by zhu hao on 2020/2/9.
//  Copyright © 2020 zhu hao. All rights reserved.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 断言
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let a = 1
        let b = 2
        let expected = 3
        let actual = add(a:a,b:b)
        XCTAssert(expected == actual, "add 方法错误")
    }

    // 性能测试
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            sleep(1)
        }
    }
    
    func add(a:Int,b:Int) -> Int {
        return a + b
    }
    
    // 期望
    func testAsynExample() {
        let expect = self.expectation(description: "oh time out")
        
        let queue = OperationQueue()
        let operation = BlockOperation { () -> Void in
            sleep(2)
            XCTAssert(true,"some error info")
            expect.fulfill()
        }
        queue.addOperation(operation)
        
        self.wait(for: [expect], timeout: 3)
    }
}
