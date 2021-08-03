//
//  MovieDetailsViewController.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var viewModel: MovieDetailsViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var plotLabel: UILabel!
    
    @IBOutlet weak var rating1Label: UILabel!
    @IBOutlet weak var rating2Label: UILabel!
    @IBOutlet weak var rating3Label: UILabel!
    
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
        updateView()
    }
    

    func updateView() {
        title = "Detail"
        imageView.sd_setImage(with: viewModel?.posterUrl, placeholderImage: UIImage(named: "placeholder"))
        titleLabel.text = viewModel?.title
        yearLabel.text = viewModel?.year
        
        genreLabel.text = viewModel?.genre
        runtimeLabel.text = viewModel?.runtime
        ratingLabel.text = viewModel?.imdbRating
        
        plotLabel.text = viewModel?.plot
        
        rating1Label.text = viewModel?.rating1
        rating2Label.text = viewModel?.rating2
        rating3Label.text = viewModel?.rating3
        
        directorLabel.text = viewModel?.director
        writerLabel.text = viewModel?.writer
        actorsLabel.text = viewModel?.actors
        
    }

}
