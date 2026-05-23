//
//  HomePageViewModel.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//
import Observation
import Foundation

@Observable
class HomePageViewModel {
    
    var homePageData: AVODHomePage?
    var isLoading: Bool = false
    var errorMessage: String?
    
    let fetchHomePageUseCase: FetchHomePageUseCaseProtocol
    
    init(fetchHomePageUseCase: FetchHomePageUseCaseProtocol) {
        self.fetchHomePageUseCase = fetchHomePageUseCase
    }
    
    @MainActor
    func fetchHomePage() async {
        isLoading = true
        errorMessage = nil
        do {
            self.homePageData = try await fetchHomePageUseCase.execute()
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}
