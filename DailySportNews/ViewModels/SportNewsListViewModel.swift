//
//  SportNewsListViewModel.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/14/22.
//

import Foundation
import SwiftyJSON
import SwiftUI

class SportNewsListViewModel: ObservableObject {
    
    @Published var sportNewsArticles = [Article]()
    
    
    init () {
        loadNewsDataResponse()
    }
    
    enum Country: String, CaseIterable {
        case italy = "Italy"
        case unitedstates = "United States"
        case unitedkingdom = "United Kingdom"
        case mexico = "Mexico"
        case china = "China"
        case canada = "Canada"
        case france = "France"
        case nigeria = "Nigeria"
    }

    var currentCountry: Country = .unitedstates
    
    var currentCountryString: String {
        return currentCountry.rawValue
    }
    
    @Published var countriesListIsPresent: Bool = false
    
    @Published var currentCountryCode: String = "us"
    
    
    func updateCurrentCountryCode(country: Country) {
        switch country {
        case .unitedstates:
            currentCountry = country
            currentCountryCode = "us"
        case .unitedkingdom:
            currentCountry = country
            currentCountryCode = "gb"
        case .italy:
            currentCountry = country
            currentCountryCode = "it"
        case .mexico:
            currentCountry = country
            currentCountryCode = "mx"
        case .china:
            currentCountry = country
            currentCountryCode = "cn"
        case .canada:
            currentCountry = country
            currentCountryCode = "ca"
        case .france:
            currentCountry = country
            currentCountryCode = "fr"
        case .nigeria:
            currentCountry = country
            currentCountryCode = "ng"
        }
        
        
    }
    
    func toggleCountriesList() {
        withAnimation(.easeInOut) {
            countriesListIsPresent.toggle()
        }
    }
    
    
    func loadNewsDataResponse() {
        sportNewsArticles = []
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(currentCountryCode )&category=sports&apiKey=9af8ef432f1040fda6e67488688748d7"
        
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
                let description = article.1["description"].stringValue
                let url = article.1["url"].stringValue
                let urlToImage = article.1["urlToImage"].stringValue
                let publishedAt = article.1["publishedAt"].stringValue
                let source = article.1["source"]["name"].stringValue
                print(source)

                DispatchQueue.main.async {
                    
                    self.sportNewsArticles.append(
                        Article(
                            name: source,
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
