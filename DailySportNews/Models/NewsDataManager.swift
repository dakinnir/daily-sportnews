//
//  NewsDataManager.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/14/22.
//

import Foundation
import SwiftyJSON
import SwiftUI


struct NewsDataManager {
    
}


class SportNewsListViewModel: ObservableObject {
    
    @Published var sportNewsArticles = [NewsArticle]()
    
    init () {
        loadNewsDataResponse()
    }
    
    func loadNewsDataResponse() {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=9af8ef432f1040fda6e67488688748d7"
        
        let urlSource = URL(string: urlString)
        let session = URLSession.init(configuration: .default)
        session.dataTask(with: urlSource!) { data, _, error in
            if (error != nil) {
                print(error?.localizedDescription as Any)
                return
                
            }
            
            let jsonData = try! JSON(data: data!)
            for article in jsonData["articles"] {
                let author = article.1["author"].stringValue
                let title = article.1["title"].stringValue
                print(title)
                let description = article.1["description"].stringValue
                let url = article.1["url"].stringValue
                let urlToImage = article.1["urlToImage"].stringValue
                let publishedAt = article.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    self.sportNewsArticles.append(
                        NewsArticle(
                            author: author,
                            title: title,
                            desription: description,
                            url: url,
                            urlToImage: urlToImage,
                            publishedAt: publishedAt)
                    )
                }
            }
        }.resume()
    }
}
