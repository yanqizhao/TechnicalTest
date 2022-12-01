//
//  MockFailureItemListInteractor.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
@testable import TradeMe

final class MockFailureItemListInteractor: ItemListProtocol {
    
    func getItemList(onCompletion: @escaping (Result<[DTOListItem], Error>) -> Void) {
        onCompletion(.failure(BOError(errorMessage: "sorry")))
    }
    
}
