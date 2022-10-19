//
//  TodoAPI_Helper.swift
//  apicaller
//
//  Created by Athif on 2022-10-18.
//

import Foundation


enum TodoData{
    case success(Todo)
    case failure(Error)
}

class TodoAPI_Helper {
    private static let baseURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchTodo(callback: @escaping (TodoData)->Void){
        let request = URLRequest(url: baseURL)
        let task = session.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let todos = try decoder.decode(Todo.self, from: data)

                    callback(.success(todos))
                    
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

