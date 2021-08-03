//
//  MovieListViewModel.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import Foundation

struct MovieListViewModel {
    
    let movies: [Movie]?
    
    var numberOfMovies: Int {
        return movies?.count ?? 0
    }
    
    var numberOfSections: Int {
        return 1
    }
}
