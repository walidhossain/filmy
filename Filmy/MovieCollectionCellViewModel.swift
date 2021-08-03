//
//  MovieCollectionViewModel.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import Foundation

struct MovieCollectionCellViewModel {
    
    let movie: Movie
    
    var title: String {
        return movie.title
    }
    
    var year: String {
        return movie.year
    }
    
    var posterUrl: URL? {
        return URL.init(string: movie.poster)
    }
    
    var imdbID: String {
        return movie.imdbID
    }
    
    var type: String {
        return movie.type
    }
}
