//
//  NewsCard.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/14/22.
//

import SwiftUI

struct NewsCard: View {
    var body: some View {
        ZStack {
        
            Image("klay")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .shadow(color: .black, radius: 20, x: 0, y: 10)


                
            
        }
        .padding()
        
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard()
    }
}
