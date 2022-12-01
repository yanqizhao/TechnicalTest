//
//  ItemFacade.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

final class ItemFacade: ItemProtocol {}

extension ItemFacade: ItemListProtocol {
    
    func getItemList(onCompletion: @escaping (Result<[DTOListItem], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            ItemListInteractor().getItemList { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let items):
                        onCompletion(.success(items))
                    case .failure(let error):
                        onCompletion(.failure(error))
                    }
                }
            }
        }
    }
    
}
