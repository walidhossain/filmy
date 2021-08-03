//
//  MovieListViewController.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    let searchController = UISearchController()
    
    var viewModel: MovieListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: screenWidth / 2.3, height: screenHeight / 3)
        movieCollectionView.collectionViewLayout = layout
    }

    func fetchSearchResult(_ searchText: String) {
        let encodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? searchText
        WebServiceClient.sharedInstance.searchMovie(encodedSearchText) { movies, error in
            DispatchQueue.main.async {
                if let movies = movies {
                    self.viewModel = MovieListViewModel(movies: movies)
                    self.movieCollectionView.reloadData()
                    self.searchController.isActive = false
                }
            }
        }
    }

}

extension MovieListViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        fetchSearchResult(searchText)
    }
}

extension MovieListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        if let viewModel = viewModel {
            cell.viewModel = MovieCollectionCellViewModel(movie: viewModel.movies![indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections
    }
}

extension MovieListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let imdbID = viewModel?.movies![indexPath.row].imdbID {
            WebServiceClient.sharedInstance.getMovieDetail(imdbID) { movie, error in
                DispatchQueue.main.async {
                    
                    if let movie = movie, let movieDetailsViewController = self.storyboard?.instantiateViewController(identifier: "MovieDetailsViewController") as? MovieDetailsViewController {
                        movieDetailsViewController.viewModel = MovieDetailsViewModel(movie: movie)
                        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
                    }
                }
            }
        }
    }
}

