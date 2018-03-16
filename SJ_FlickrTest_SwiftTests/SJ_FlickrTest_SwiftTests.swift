//
//  SJ_FlickrTest_SwiftTests.swift
//  SJ_FlickrTest_SwiftTests
//
//  Created by Surjit Joshi on 16/03/18.
//  Copyright © 2018 Surjit Joshi. All rights reserved.
//

import XCTest
@testable import SJ_FlickrTest_Swift

class SJ_FlickrTest_SwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGitUserData() {
        guard let gitUrl = URL(string: "https://api.github.com/users/jsurjit123") else { return }
        let promise = expectation(description: "Simple Request")
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    XCTAssertTrue(result["name"] as! String == "Surjit Joshi")
                    XCTAssertTrue(result["location"] as! String == "Pune")
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testFlickrData() {
        guard let gitUrl = URL(string: "https://api.github.com/users/jsurjit123") else { return }
        let promise = expectation(description: "Simple Request")
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    XCTAssertTrue(result["name"] as! String == "Surjit Joshi")
                    XCTAssertTrue(result["location"] as! String == "Pune")
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}
