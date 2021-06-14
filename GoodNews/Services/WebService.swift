//
//  WebService.swift
//  GoodNews
//
//  Created by MiciH on 6/13/21.
//

import Foundation

class WebService {
    
    //pass url get block of articles
    func getArticle(url: URL, completion: @escaping ([Article]?) -> ()){
        // open a url task session
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                print(data)
                
                let listArticles = try? JSONDecoder().decode(ListArticles.self, from: data)
                
                if let listArticles = listArticles{
                    listArticles.articles
                    completion(listArticles.articles)
                }
                
//                print(listArticles?.articles)
            }
            
        }.resume()
    }
    
}
