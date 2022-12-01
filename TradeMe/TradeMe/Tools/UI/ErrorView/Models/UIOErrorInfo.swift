//
//  UIOErrorInfo.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

struct UIOErrorInfo {
    
    let error: Error
    let retryAction: ((ErrorView) -> Void)
    
}
