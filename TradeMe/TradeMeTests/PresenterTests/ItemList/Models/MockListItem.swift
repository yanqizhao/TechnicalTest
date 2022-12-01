//
//  MockListItem.swift
//  TradeMeTests
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation
@testable import TradeMe

struct MockListItem: DTOListItem {

    let id: Int = 2149478424
    let Title: String = "RIGHT REAR DOOR WINDOW [2008-2012 MAZDA ATENZA / MAZDA 6]"
    let PictureHref: String? = nil
    let Region: String = "Bay of Plenty"
    let HasBuyNow: Bool? = true
    let BuyNowPrice: Double? = 45.0
    let PriceDisplay = "$45.00"
    let IsClassified: Bool? = false
    let IsReserveMet: Bool? = false
    
}
