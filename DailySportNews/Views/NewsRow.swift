//
//  NewsRow.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/15/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsRow: View {
    
    var article: Article
    
    var body: some View {
        HStack {
            if !article.urlToImage.isEmpty {
                WebImage(url: URL(string: article.urlToImage), options: .highPriority, context: nil)
                    .resizable()
                    .frame(width: 120, height: 100)
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.6), radius: 5, x: 0, y: 5)
                    .padding(.trailing)
            } else {
                Text("No Image Present")
                    .frame(width: 120, height: 100)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.6), radius: 5, x: 0, y: 5)
                    .padding(.trailing)
            }
            VStack(alignment: .leading, spacing: 10) {
                
                Text(article.title)
                    .font(.caption)
                    .bold()
                
                
                Text(article.name)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(article: SportNewsListViewModel().sportNewsArticles[0])
    }
}
