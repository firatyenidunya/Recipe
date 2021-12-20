//
//  TitleAndImageCollectionViewCell.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit

class TitleAndImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .secondary
    }

    func configure(with title: String,
                   imageURL: URL) {
        titleLabel.text = title
        topImageView.setImage(with: imageURL)
    }
}
