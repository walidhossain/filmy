//
//  MovieCollectionViewCell.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var viewModel: MovieCollectionCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        imageView.sd_setImage(with: viewModel?.posterUrl, placeholderImage: UIImage(named: "placeholder"))
        titleLabel.text = viewModel?.title
        yearLabel.text = viewModel?.year
    }
}
