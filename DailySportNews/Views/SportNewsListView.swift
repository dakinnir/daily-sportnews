//
//  ContentView.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/13/22.
//

import SwiftUI

struct SportNewsListView: View {
    
    @State var searchText: String = ""
    
    @EnvironmentObject private var sportNewsListViewModel: SportNewsListViewModel
    
    var body: some View {
        ZStack {
            VStack {
                filterMenu
                List {
                    ForEach(sportNewsListViewModel.sportNewsArticles.filter({ searchText.isEmpty ? true : $0.title.contains(searchText)}), id: \.self) { article in
                        Link(destination: URL(string: article.url)!) {
                            NewsRow(article: article)
                        }.foregroundColor(.black)
                    }
                }
                .refreshable {
                    sportNewsListViewModel.loadNewsDataResponse()
                }
                .searchable(text: $searchText)
            }
            .navigationTitle("Daily Sports News")
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
        SportNewsListView().environmentObject(SportNewsListViewModel())
    }
}

extension SportNewsListView {
    
    private var filterMenu: some View {
        VStack {
            Button {
                sportNewsListViewModel.toggleCountriesList()
            } label: {
                Text(sportNewsListViewModel.currentCountryString)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: sportNewsListViewModel.countriesListIsPresent ? 180 : 0))
                    }
            }
            
            if sportNewsListViewModel.countriesListIsPresent {
                CountryFilterListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding(.horizontal)
    }
}
