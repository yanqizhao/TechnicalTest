//
//  ItemListCell.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit
import Kingfisher

final class ItemListCell: UITableViewCell, DequeuableProtocol {

    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var reserveLabel: UILabel!
    
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
        reserveLabel.text = "Reserve met"
        
        let urlString = item.PictureHref ?? ""
        let url = URL(string: urlString)
        pictureImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }

}
