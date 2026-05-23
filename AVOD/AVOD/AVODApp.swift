//
//  AVODApp.swift
//  AVOD
//
//  Created by pajonn on 22/05/26.
//

import SwiftUI

@main
struct AVODApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(homePageViewModel: DIContainer.shared.makeHomePageViewModel())
        }
    }
}
