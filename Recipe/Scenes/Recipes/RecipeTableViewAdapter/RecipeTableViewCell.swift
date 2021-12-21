//
//  RecipeTableViewCell.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import UIKit

struct RecipeTableViewCellUIModel {
    let title: String
    let coverImageURL: URL
    let isFavorited: Bool
    let indexPath: IndexPath
}

protocol RecipeTableViewCellDelegate: AnyObject {
    func didAddFavorites(at indexPath: IndexPath)
}

class RecipeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet weak var addToFavoritesButton: UIButton!

    //MARK: - Properties

    weak var delegate: RecipeTableViewCellDelegate?
    var cellUIModel: RecipeTableViewCellUIModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLabel.textColor = .primary
    }

    func configure(with cellUIModel: RecipeTableViewCellUIModel) {
        self.cellUIModel = cellUIModel

        titleLabel.text = cellUIModel.title
        coverImage.setImage(with: cellUIModel.coverImageURL)
        addToFavoritesButton.isSelected = cellUIModel.isFavorited
    }

    @IBAction func addToFavoritesButtonOnClick(_ sender: Any) {
        guard let indexPath = cellUIModel?.indexPath else { return }
        delegate?.didAddFavorites(at: indexPath)
    }
}
