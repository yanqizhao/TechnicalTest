//
//  ItemListFacadeTest.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import XCTest
@testable import TradeMe

final class ItemListFacadeTest: XCTestCase {
    
    func test_getItemList_callBack_onMainThread() {
        ItemFacade().getItemList { _ in
            XCTAssertTrue(Thread.isMainThread)
        }
    }
    
    func test_getItemList() {
        let e = getExpectation()
        var items: [DTOListItem]?
        var updateError: Error?
        ItemFacade().getItemList { result in
            switch result {
            case .success(let dtos):
                items = dtos
            case .failure(let error):
                updateError = error
            }
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertEqual(items?.count, 20)
        XCTAssertNil(updateError)
        let firstItem = items?.first
        XCTAssertEqual(firstItem?.Region, "Bay of Plenty")
        XCTAssertEqual(firstItem?.PriceDisplay, "$45.00")
    }

}
