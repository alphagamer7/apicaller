//
//  News_Helper.swift
//  apicaller
//
//  Created by Athif on 2022-10-18.
//

import Foundation

enum NewsData{
    case success(NewsResult)
    case failure(Error)
}

class NewsAPI_Helper {

    //Make sure to change the dates if
    private static let baseURL = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-10-17&to=2022-10-18&sortBy=popularity&apiKey=59832f006d0f4503a89df7cde39e8504")!

    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchNews(callback: @escaping (NewsData)->Void){
        let request = URLRequest(url: baseURL)
        let task = session.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode(NewsResult.self, from: data)

                    callback(.success(news))
                    
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
