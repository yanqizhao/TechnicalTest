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
    let IsReserveMet: Bool?
    
    init?(dl: DLItem) {
        id = dl.id
        Title = dl.Title
        PictureHref = dl.PictureHref
        Region = dl.Region
        HasBuyNow = dl.HasBuyNow
        BuyNowPrice = dl.BuyNowPrice
        PriceDisplay = dl.PriceDisplay
        IsClassified = dl.IsClassified
        IsReserveMet = dl.IsReserveMet
    }
    
}
