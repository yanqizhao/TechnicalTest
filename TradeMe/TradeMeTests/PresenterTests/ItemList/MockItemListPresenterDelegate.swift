//
//  MockItemListPresenterDelegate.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
@testable import TradeMe

final class MockItemListPresenterDelegate: ItemListPresenterDelegate {
    
    var changeTitleAction: ((String) -> Void)?
    var startBackgroundActivityAction: (() -> Void)?
    var finishBackgroundActivityAction: (() -> Void)?
    var updateItemsAction: (([DTOListItem]) -> Void)?
    var updateFailedAction: ((Error) -> Void)?
    var navigateAction: ((String) -> Void)?
    
    func didChange(title: String) {
        changeTitleAction?(title)
    }
    
    func didStartBackgroundActivity() {
        startBackgroundActivityAction?()
    }
    
    func didFinishBackgroundActivity() {
        finishBackgroundActivityAction?()
    }
    
    func onUpdateItemData(with items: [DTOListItem]) {
        updateItemsAction?(items)
    }
    
    func onUpdateItemDataFailure(error: Error) {
        updateFailedAction?(error)
    }
    
    func onNavigateDetailPage(with id: String) {
        navigateAction?(id)
    }
    
    
}
