//
//  ItemListPresenterTest.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import XCTest
@testable import TradeMe

final class ItemListPresenterTest: XCTestCase {

    func test_onViewDidLoad() {
        let e = getExpectation()
        let delegate = MockItemListPresenterDelegate()
        let presenter = ItemListPresenter.init(delegate: delegate, interactor: MockSuccessItemListInteractor())
        var title: String?
        var hasStartedBackgroundActivity: Bool?
        var hasFinishedBackgroundActivity: Bool?
        delegate.changeTitleAction = { text in
            title = text
        }
        delegate.startBackgroundActivityAction = {
            hasStartedBackgroundActivity = true
        }
        delegate.finishBackgroundActivityAction = {
            hasFinishedBackgroundActivity = true
            e.fulfill()
        }
        presenter.onViewDidLoad()
        waitForExpectation()
        XCTAssertEqual(title, "Browse")
        XCTAssertEqual(hasStartedBackgroundActivity, true)
        XCTAssertEqual(hasFinishedBackgroundActivity, true)
    }
    
    func test_updateList_onSuccess() {
        let e = getExpectation()
        let delegate = MockItemListPresenterDelegate()
        let presenter = ItemListPresenter.init(delegate: delegate, interactor: MockSuccessItemListInteractor())
        var updatedItems: [DTOListItem] = []
        var updateError: Error?
        delegate.updateItemsAction = { items in
            updatedItems = items
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updateError)
        XCTAssertEqual(updatedItems.count, 1)
        let firstItem = updatedItems.first
        let mockItem = MockListItem()
        
        XCTAssertEqual(firstItem?.Region, mockItem.Region)
        XCTAssertEqual(firstItem?.PriceDisplay, mockItem.PriceDisplay)
        XCTAssertEqual(firstItem?.HasBuyNow, mockItem.HasBuyNow)
    }
    
    func test_updateList_onFailure() {
        let e = getExpectation()
        let delegate = MockItemListPresenterDelegate()
        let presenter = ItemListPresenter.init(delegate: delegate, interactor: MockFailureItemListInteractor())
        var updatedItems: [DTOListItem]?
        var updateError: Error?
        delegate.updateItemsAction = { items in
            updatedItems = items
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updatedItems)
        XCTAssertEqual(updateError?.localizedDescription, "sorry")
    }
    
    func test_rowsCount() {
        let e = getExpectation()
        let presenter = ItemListPresenter.init(delegate: MockItemListPresenterDelegate(), interactor: MockSuccessItemListInteractor())
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertEqual(presenter.rowsCount, 1)
    }
    
    func test_getItemAtIndexPath() {
        let e = getExpectation()
        let presenter = ItemListPresenter.init(delegate: MockItemListPresenterDelegate(), interactor: MockSuccessItemListInteractor())
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        let mockItem = MockListItem()
        let firstItem = presenter.getItem(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(firstItem.Region, mockItem.Region)
        XCTAssertEqual(firstItem.PriceDisplay, mockItem.PriceDisplay)
        XCTAssertEqual(firstItem.HasBuyNow, mockItem.HasBuyNow)
    }

}
