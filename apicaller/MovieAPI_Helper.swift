//
//  MovieAPI_Helper.swift
//  apicaller
//
//  Created by Athif on 2022-10-18.
//

import Foundation

enum MovieData{
    case success(Movie)
    case failure(Error)
}

class MovieAPI_Helper {
    // movie api starting with M
    private static let baseURL = URL(string: "https://omdbapi.com/?i=tt3896198&apikey=edc89387&t=M")!

    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchMovies(callback: @escaping (MovieData)->Void){
        let request = URLRequest(url: baseURL)
        let task = session.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let movie = try decoder.decode(Movie.self, from: data)

                    callback(.success(movie))
                    
                } catch let e {
                    callback(.failure(e))
                }
            } else if let error = error {
                callback(.failure(error))
            }
        }
        task.resume()
    }
}
