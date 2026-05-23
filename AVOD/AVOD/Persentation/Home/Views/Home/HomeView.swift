//
//  HomeView.swift
//  AVOD
//
//  Created by pajonn on 22/05/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var homePageViewModel: HomePageViewModel
    
    init(homePageViewModel: HomePageViewModel) {
        self.homePageViewModel = homePageViewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if homePageViewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = homePageViewModel.errorMessage {
                    ErrorView(errorMsg: errorMessage)
                } else if let homeData = homePageViewModel.homePageData {
                    ContentView(homeData: homeData)
                }
            }.navigationTitle(homePageViewModel.homePageData?.record?.page?.name ?? "")
            .task {
                await homePageViewModel.fetchHomePage()
            }
        }
    }
}

#Preview {
    HomeView(homePageViewModel: DIContainer.shared.makeHomePageViewModel())
}
