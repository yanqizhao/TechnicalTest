//
//  BOError.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

struct BOError: Error {

    let errorMessage: String
    
}

extension BOError: LocalizedError {
    
    var errorDescription: String? {
        return NSLocalizedString(errorMessage, comment: "")
    }
    
}
