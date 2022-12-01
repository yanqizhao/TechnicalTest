//
//  DequeuableProtocol.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit

protocol DequeuableProtocol {
    
    static var dequeueIdentifier: String { get }
    
}

extension DequeuableProtocol where Self: UITableViewCell {
    
    static var dequeueIdentifier: String {
        return NSStringFromClass(self)
    }
    
}
