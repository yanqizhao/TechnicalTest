//
//  UITableView+Dequeuable.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: DequeuableProtocol {
        register(T.self, forCellReuseIdentifier: T.dequeueIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(for cellType: T.Type = T.self) -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.dequeueIdentifier) as? T else {
            fatalError()
        }
        return cell
    }
    
}
