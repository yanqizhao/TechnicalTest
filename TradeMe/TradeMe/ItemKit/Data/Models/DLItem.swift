//
//  DLItem.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

struct DLItem: Codable {

    enum CodingKeys: String, CodingKey {
        case Title, PictureHref, Region, HasBuyNow, BuyNowPrice, PriceDisplay, IsClassified, IsReserveMet
        case id = "ListingId"
    }
    
    let id: Int
    let Title: String
    let PictureHref: String?
    let Region: String
    let HasBuyNow: Bool?
    let BuyNowPrice: Double?
    let PriceDisplay: String
    let IsClassified: Bool?
    let IsReserveMet: Bool?
}

struct DLResponse: Codable {
    let List: [DLItem]
}
