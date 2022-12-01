//
//  TradeMeUITests.swift
//  TradeMeUITests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import XCTest
@testable import TradeMe

final class TradeMeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.children(matching: .window).element.tap()

        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Notifications"].tap()
        tabBar.buttons["Watchlist"].tap()
        tabBar.buttons["My Trade Me"].tap()
        tabBar.buttons["Browse"].tap()
        
        app.tables.children(matching: .cell).element(boundBy: 2).staticTexts["$45.00"].tap()
        
        let okButton = app.alerts["Coming soon"].scrollViews.otherElements.buttons["OK"]
        okButton.tap()
        
        let browseNavigationBar = app.navigationBars["Browse"]
        browseNavigationBar.buttons["Item"].tap()
        okButton.tap()
        browseNavigationBar.children(matching: .button).element(boundBy: 1).tap()
        okButton.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
