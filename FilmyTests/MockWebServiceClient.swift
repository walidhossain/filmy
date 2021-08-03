//
//  MockWebServiceClient.swift
//  FilmyTests
//
//  Created by Walid Hossain on 3/8/21.
//

import Foundation
@testable import Filmy

struct MockWebServiceClient : WebService {
    
    var movies: [Movie]?
    var movie: Movie?
    var error: WebServiceError?
    
    func searchMovie(_ searchText: String, completion: @escaping ([Movie]?, WebServiceError?) -> ()) {
        guard let movies = self.movies else {
            completion(nil, self.error!)
            return
        }
        completion(movies, nil)
    }
    
    func getMovieDetail(_ movieId: String, completion: @escaping (Movie?, WebServiceError?) -> ()) {
        guard let movie = self.movie else {
            completion(nil, self.error!)
            return
        }
        completion(movie, nil)
    }
    
    
}
