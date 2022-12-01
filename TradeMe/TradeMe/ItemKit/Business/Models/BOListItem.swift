//
//  BOListItem.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

struct BOListItem: DTOListItem {
    
    let id: Int
    let Title: String
    let PictureHref: String?
    let Region: String
    let HasBuyNow: Bool?
    let BuyNowPrice: Double?
    let PriceDisplay: String
    let IsClassified: Bool?

    init?(dl: DLItem) {
        id = dl.id
        Title = dl.Title
        PictureHref = dl.PictureHref
        Region = dl.Region
        HasBuyNow = dl.HasBuyNow
        BuyNowPrice = dl.BuyNowPrice
        PriceDisplay = dl.PriceDisplay
        IsClassified = dl.IsClassified
    }
    
}

extension BOListItem: Comparable {
    
    static func < (lhs: BOListItem, rhs: BOListItem) -> Bool {
//        return lhs.Date < rhs.Date
        return true
    }
    
}
