//
//  NewsArticle.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/14/22.
//

import Foundation

struct NewsArticle: Hashable {
    let author: String
    let title: String
    let desription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}
