//
//  DTOListItem.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

public protocol DTOListItem {
    
    var id: Int { get }
    var Title: String { get }
    var PictureHref: String? { get }
    var Region: String { get }
    var HasBuyNow: Bool? { get }
    var BuyNowPrice: Double? { get }
    var PriceDisplay: String { get }
    var IsClassified: Bool? { get }
}
