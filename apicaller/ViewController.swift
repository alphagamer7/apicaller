//
//  ViewController.swift
//  apicaller
//
//  Created by Athif on 2022-10-18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();

    }
    
    @IBAction func handleMovieListCall(_ sender: Any) {
        MovieAPI_Helper.fetchMovies{ response in
                switch response{
                case let .success(movies):
                   
                    print("movies clicked");
                    print(movies);
                case let .failure(error):
                    print(error)
                }
    
                DispatchQueue.main.async {
                }
        }
       
    }
    
    
    @IBAction func handleNewsApiCall(_ sender: Any) {
        NewsAPI_Helper.fetchNews{ response in
                switch response{
                    case let .success(news):
                        
                        print(news);
                    case let .failure(error):
                        print(error);
                    }
        
                    DispatchQueue.main.async {
                    }
        }
    }
    
    @IBAction func handleCatApiCall(_ sender: Any) {
        NewsAPI_Helper.fetchNews{ response in
                switch response{
                    case let .success(news):
                        
                        print(news);
                    case let .failure(error):
                        print(error);
                    }
        
                    DispatchQueue.main.async {
                    }
        }
    }
    
    @IBAction func handleTypiApiCall(_ sender: Any) {
        TodoAPI_Helper.fetchTodo{ response in
                switch response{
                case let .success(todos):
                   
                    print("handleTypiApiCall clicked");
                    print(todos);
                case let .failure(error):
                    print(error)
                }
    
                DispatchQueue.main.async {
                }
        }
    }


}

