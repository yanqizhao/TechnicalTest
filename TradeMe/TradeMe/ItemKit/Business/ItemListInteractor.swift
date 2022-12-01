//
//  ItemListInteractor.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

final class ItemListInteractor {
    
    func getItemList(onCompletion: @escaping (Result<[BOListItem], Error>) -> Void) {
        ItemListRepository().getItemList { result in
            switch result {
            case .success(let items):
                let boItems = items.compactMap { BOListItem(dl: $0) }
                onCompletion(.success(boItems))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
