//
//  ItemListProtocol.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

public protocol ItemListProtocol {
    
    func getItemList(onCompletion: @escaping (Result<[DTOListItem], Error>) -> Void)
    
}
