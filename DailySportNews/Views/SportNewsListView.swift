//
//  ContentView.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/13/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SportNewsListView: View {
    
    @State var searchText: String = ""
    @ObservedObject var sportNewsListViewModel = SportNewsListViewModel()
    
    var body: some View {
        List {
            ForEach(sportNewsListViewModel.sportNewsArticles, id: \.self) { article in
                Link(destination: URL(string: article.url)!) {
                    HStack {
                        WebImage(url: URL(string: article.urlToImage), options: .highPriority, context: nil)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10, x: 0, y: 10)
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(article.title)
                                .font(.caption)
                            
                            HStack(spacing: 8) {
                                Text("Source: ")
                                Text(article.name)
                                    .lineLimit(1)
                            }
                            .font(.caption)
                        }
                    }
                }.foregroundColor(.black)
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Daily Sports News")
    }
    
    var searchResults: [Article] {
        if searchText.isEmpty {
            return sportNewsListViewModel.sportNewsArticles
        } else {
            return sportNewsListViewModel.sportNewsArticles.filter { $0.title.contains(searchText) }
        }
    }
}

extension SportNewsListView {
    
    private var listSection: some View {
        return Text("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SportNewsListView()
    }
}
