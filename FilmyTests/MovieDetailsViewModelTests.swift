//
//  MovieDetailsViewModelTests.swift
//  FilmyTests
//
//  Created by Walid Hossain on 3/8/21.
//

import XCTest
@testable import Filmy

class MovieDetailsViewModelTests: XCTestCase {

    var viewModel: MovieDetailsViewModel!
    
    override func setUpWithError() throws {
        let json = """
            {
              "Title": "Captain Marvel",
              "Year": "2019",
              "Rated": "PG-13",
              "Released": "08 Mar 2019",
              "Runtime": "123 min",
              "Genre": "Action, Adventure, Sci-Fi",
              "Director": "Anna Boden, Ryan Fleck",
              "Writer": "Anna Boden, Ryan Fleck, Geneva Robertson-Dworet",
              "Actors": "Brie Larson, Samuel L. Jackson, Ben Mendelsohn",
              "Plot": "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
              "Language": "English",
              "Country": "United States, Australia",
              "Awards": "9 wins & 52 nominations",
              "Poster": "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg",
              "Ratings": [
                {
                  "Source": "Internet Movie Database",
                  "Value": "6.8/10"
                },
                {
                  "Source": "Rotten Tomatoes",
                  "Value": "79%"
                },
                {
                  "Source": "Metacritic",
                  "Value": "64/100"
                }
              ],
              "Metascore": "64",
              "imdbRating": "6.8",
              "imdbVotes": "477,939",
              "imdbID": "tt4154664",
              "Type": "movie",
              "DVD": "28 May 2019",
              "BoxOffice": "$426,829,839",
              "Production": "Marvel Studios",
              "Website": "N/A",
              "Response": "True"
            }
            """
        let decoder = JSONDecoder()
        let movie = try decoder.decode(Movie.self, from: Data(json.utf8))
        viewModel = MovieDetailsViewModel(movie: movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitle() throws {
        XCTAssertEqual(viewModel.title,"Captain Marvel")
    }
    
    func testYear() throws {
        XCTAssertEqual(viewModel.year,"2019")
    }
    
    func testPosterUrl() throws {
        XCTAssertEqual(viewModel.posterUrl,URL.init(string: "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg"))
    }
    
    func testRuntime() throws {
        XCTAssertEqual(viewModel.runtime ,"123 min")
    }
    
    func testGenre() throws {
        XCTAssertEqual(viewModel.genre,"Action, Adventure, Sci-Fi")
    }
    
    func testimdbRating() throws {
        XCTAssertEqual(viewModel.imdbRating,"⭐ 6.8")
    }
    
    func testPlot() throws {
        XCTAssertEqual(viewModel.plot,"Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.")
    }
    
    func testRating1() throws {
        XCTAssertEqual(viewModel.rating1,"Internet Movie Database\n6.8/10")
    }
    
    func testRating2() throws {
        XCTAssertEqual(viewModel.rating2,"Rotten Tomatoes\n79%")
    }
    
    func testRating3() throws {
        XCTAssertEqual(viewModel.rating3,"Metacritic\n64/100")
    }
    
    func testDirector() throws {
        XCTAssertEqual(viewModel.director,"Director: Anna Boden, Ryan Fleck")
    }
    
    func testWriter() throws {
        XCTAssertEqual(viewModel.writer,"Writer: Anna Boden, Ryan Fleck, Geneva Robertson-Dworet")
    }
    
    func testActors() throws {
        XCTAssertEqual(viewModel.actors,"Actors: Brie Larson, Samuel L. Jackson, Ben Mendelsohn")
    }

}
