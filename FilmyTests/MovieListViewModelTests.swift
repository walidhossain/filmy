//
//  MovieListViewModelTests.swift
//  FilmyTests
//
//  Created by Walid Hossain on 3/8/21.
//

import XCTest
@testable import Filmy

class MovieListViewModelTests: XCTestCase {
    
    var viewModel: MovieListViewModel!

    override func setUpWithError() throws {
        let json = """
            {"Search":[{"Title":"Captain Marvel","Year":"2019","imdbID":"tt4154664","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg"},{"Title":"Marvel One-Shot: Agent Carter","Year":"2013","imdbID":"tt3067038","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZDIwZTM4M2QtMWFhYy00N2VmLWFlMjItMzI3NjBjYTc0OTMxXkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"},{"Title":"Marvel One-Shot: All Hail the King","Year":"2014","imdbID":"tt3438640","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZGFkMTZkMDQtNzM4Yy00YWEwLTkzOWEtZTMyNDRlNmJhYWJhXkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"},{"Title":"Marvel One-Shot: Item 47","Year":"2012","imdbID":"tt2247732","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjNlMzAxNmQtOGEwZi00NTEyLWI0NWYtMTlhNmE2YTA3ZDVhXkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"},{"Title":"Marvel One-Shot: A Funny Thing Happened on the Way to Thor's Hammer","Year":"2011","imdbID":"tt2011109","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYmVlYTg3N2QtMWM2OS00YWQyLWI2M2MtMDc0ZjBkZjk1MTY3XkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"},{"Title":"Marvel One-Shot: The Consultant","Year":"2011","imdbID":"tt2011118","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNGE4YjU5MDAtYzYzMC00M2RlLTk0NDgtNDU1MjgyMGI0MjI3XkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"},{"Title":"Marvel Studios: Assembling a Universe","Year":"2014","imdbID":"tt3591568","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZjNiN2NhYzQtYmI1NC00NGRmLWE2MWYtNjAxNjMzZmYxNDJhXkEyXkFqcGdeQXVyODQ4MjU1MDk@._V1_SX300.jpg"},{"Title":"Adventures of Captain Marvel","Year":"1941","imdbID":"tt0033317","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNjg0NTk3NjUyNF5BMl5BanBnXkFtZTgwNDQ5MjM1MjE@._V1_SX300.jpg"},{"Title":"Marvel Rising: Secret Warriors","Year":"2018","imdbID":"tt7728344","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZGU5YTVlZTktNzgzMS00MGVlLTgyMGMtNWYwNTkwNGY1MzllXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"},{"Title":"Marvel 75 Years: From Pulp to Pop!","Year":"2014","imdbID":"tt4128102","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTQ4MjE1NTk3NF5BMl5BanBnXkFtZTgwMTk4Mjg2NDE@._V1_SX300.jpg"}],"totalResults":"131","Response":"True"}
            """
        let decoder = JSONDecoder()
        let searchResult = try decoder.decode(MovieSearchResult.self, from: Data(json.utf8))
        viewModel = MovieListViewModel(movies: searchResult.search)
    }

    override func tearDownWithError() throws {
    }

    func testNumberOfMovies() throws {
        XCTAssertEqual(viewModel.numberOfMovies, 10)
    }
    
    func testNumberOfSection() throws {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }

}
