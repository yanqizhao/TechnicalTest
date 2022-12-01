//
//  XCTestCase+Helper.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import XCTest

extension XCTestCase {
    
    func getExpectation() -> XCTestExpectation {
        return expectation(description: "\(#function).\(Date().timeIntervalSince1970)")
    }
    
    func waitForExpectation(timeout: TimeInterval = 1.0) {
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
}
