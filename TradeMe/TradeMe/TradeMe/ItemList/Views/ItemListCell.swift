//
//  ItemListCell.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit
import Kingfisher

final class ItemListCell: UITableViewCell, DequeuableProtocol {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var reserveLabel: UILabel!
    
    @IBOutlet weak var buyNowPriceLabel: UILabel!
    @IBOutlet weak var buyNowLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func update(item: DTOListItem) {
        regionLabel.text = item.Region
        titleLabel.text = item.Title
        
        priceLabel.text = item.PriceDisplay
        if item.IsReserveMet == true {
            reserveLabel.text = "Reserve Met"
        } else {
            reserveLabel.text = "Reserve Not Met"
        }
        
        if item.IsClassified == true {
            priceLabel.text = ""
            reserveLabel.text = "Asking price"
        }
        
        if item.HasBuyNow == true && item.BuyNowPrice != nil {
            buyNowPriceLabel.text = "$\(item.BuyNowPrice!)"
            buyNowLabel.text = "Buy Now"
        } else {
            buyNowPriceLabel.text = ""
            buyNowLabel.text = ""
        }
        
        let urlString = item.PictureHref ?? ""
        let url = URL(string: urlString)
        pictureImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }

}
