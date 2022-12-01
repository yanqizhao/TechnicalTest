//
//  AlertViewPresentable.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit

protocol AlertViewPresentable {}

extension AlertViewPresentable where Self: UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Coming soon", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        navigationController?.present(alert, animated: true)
    }
    
}
