//
//  CollectionViewCell.swift
//  CollectionViewStoryBoard
//
//  Created by Yurii on 2021/2/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with icon: Icon) {
        self.iconImageView.image = UIImage(named: icon.name)
        self.iconPriceLabel.text = "$\(icon.price)"
        backgroundView = (icon.isFeatured) ? UIImageView(image: UIImage(named: "feature-bg")) : nil
    }
}
