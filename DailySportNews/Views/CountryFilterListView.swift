//
//  CountryFilterListView.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/15/22.
//

import SwiftUI

struct CountryFilterListView: View {
    @EnvironmentObject private var sportNewsListViewModel: SportNewsListViewModel

    var body: some View {
        List {
            ForEach(SportNewsListViewModel.Country.allCases, id:\.self) { country in
                Button {
                    sportNewsListViewModel.updateCurrentCountryCode(country: country)
                    sportNewsListViewModel.loadNewsDataResponse()
                    sportNewsListViewModel.countriesListIsPresent.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(country.rawValue)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(country.rawValue)
                            .font(.subheadline)
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

struct CountryFilterListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryFilterListView().environmentObject(SportNewsListViewModel())
    }
}
