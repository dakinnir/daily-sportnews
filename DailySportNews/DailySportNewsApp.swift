//
//  DailySportNewsApp.swift
//  DailySportNews
//
//  Created by Daniel Akinniranye on 1/13/22.
//

import SwiftUI

@main
struct DailySportNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SportNewsListView()
            }
        }
    }
}
