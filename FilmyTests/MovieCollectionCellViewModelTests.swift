//
//  MovieCollectionCellViewModelTests.swift
//  FilmyTests
//
//  Created by Walid Hossain on 3/8/21.
//

import XCTest
@testable import Filmy

class MovieCollectionCellViewModelTests: XCTestCase {

    var viewModel: MovieCollectionCellViewModel!
    override func setUpWithError() throws {
        let json = """
            {"Title": "Captain Marvel",
            "Year": "2019",
            "imdbID": "tt4154664",
            "Type": "movie",
            "Poster": "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg"}
            """
        let decoder = JSONDecoder()
        let movie = try decoder.decode(Movie.self, from: Data(json.utf8))
        viewModel = MovieCollectionCellViewModel(movie: movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitle() throws {
        XCTAssertEqual(viewModel.title, "Captain Marvel")
    }
    
    func testYear() throws {
        XCTAssertEqual(viewModel.year, "2019")
    }
    
    func testImdbID() throws {
        XCTAssertEqual(viewModel.imdbID, "tt4154664")
    }
    
    func testType() throws {
        XCTAssertEqual(viewModel.type, "movie")
    }
    
    func testPoster() throws {
        XCTAssertEqual(viewModel.posterUrl, URL.init(string: "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg"))
    }

}
