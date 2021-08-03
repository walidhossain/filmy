//
//  WebServiceClient.swift
//  Filmy
//
//  Created by Walid Hossain on 2/8/21.
//

import Foundation

protocol WebService {
    func searchMovie(_ searchText: String, completion: @escaping ([Movie]?, WebServiceError?) ->())
    func getMovieDetail(_ movieId: String, completion: @escaping (Movie?, WebServiceError?) ->())
}

struct WebServiceClient : WebService {
    static let sharedInstance = WebServiceClient()
    
    var url = "https://www.omdbapi.com/?apikey=b9bd48a6"
    
    func searchMovie(_ searchText: String, completion: @escaping ([Movie]?, WebServiceError?) ->()) {
        let request = URLRequest(url: URL.init(string: "\(url)&type=movie&s=\(searchText)")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil, .error(message: error!.localizedDescription))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(MovieSearchResult.self, from: data)
                    completion(decodedResponse.search, nil)
                } catch  let e {
                    print(e)
                    completion(nil, .decode)
                }
            } else {
                completion(nil, .fetch)
            }
        }.resume()
    }
    
    func getMovieDetail(_ movieId: String, completion: @escaping (Movie?, WebServiceError?) ->()) {
        let request = URLRequest(url: URL.init(string: "\(url)&i=\(movieId)")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil, .error(message: error!.localizedDescription))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(Movie.self, from: data)
                    completion(decodedResponse, nil)
                } catch {
                    completion(nil, .decode)
                }
            } else {
                completion(nil, .fetch)
            }
        }.resume()
    }
}

enum WebServiceError: Error {
    case error(message: String)
    case httpCode(statusCode: Int)
    case network
    case fetch
    case decode
    case other
    
    var reason: String {
        switch self {
        case .error(let message):
            return message
        case .httpCode(let statusCode):
            return "The call failed with HTTP code \(statusCode)"
        case .network:
            return "The internet connection is lost"
        case .fetch:
            return"Failed to fetch data"
        case .decode:
            return "Failed to decode json"
        case .other:
            return "Unfortunately something went wrong"
        }
    }
}
