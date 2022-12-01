//
//  MockSuccessItemListInteractor.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
@testable import TradeMe

final class MockSuccessItemListInteractor: ItemListProtocol {
    
    func getItemList(onCompletion: @escaping (Result<[DTOListItem], Error>) -> Void) {
        onCompletion(.success([MockListItem()]))
    }
    
}
