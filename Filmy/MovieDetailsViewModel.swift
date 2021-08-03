//
//  MovieDetailsViewModel.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import Foundation

struct MovieDetailsViewModel {
    
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
    
    var runtime: String {
        return movie.runtime ?? ""
    }
    
    var genre: String {
        return movie.genre ?? ""
    }
    
    var imdbRating: String {
        return "⭐ \(movie.imdbRating ?? "")"
    }
    
    var plot: String {
        return movie.plot ?? ""
    }
    
    var rating1: String {
        if movie.ratings?.count == 0 {
            return ""
        }
        return "\(movie.ratings?[0].source ?? "")\n\(movie.ratings?[0].value ?? "")"
    }
    
    var rating2: String {
        if movie.ratings!.count < 2 {
            return ""
        }
        return "\(movie.ratings?[1].source ?? "")\n\(movie.ratings?[1].value ?? "")"
    }
    
    var rating3: String {
        if movie.ratings!.count < 3 {
            return ""
        }
        return "\(movie.ratings?[2].source ?? "")\n\(movie.ratings?[2].value ?? "")"
    }
    
    var director: String {
        return "Director: \(movie.director ?? "")"
    }
    
    var writer: String {
        return "Writer: \(movie.writer ?? "")"
    }
    
    var actors: String {
        return "Actors: \(movie.actors ?? "")"
    }
}
