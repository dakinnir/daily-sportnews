//
//  DailySportNewsApp.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/13/22.
//

import SwiftUI

@main
struct DailySportNewsApp: App {
    
    @StateObject private var sportNewsListViewModel = SportNewsListViewModel()

    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                SportNewsListView().environmentObject(sportNewsListViewModel)
            }
        }
    }
}
