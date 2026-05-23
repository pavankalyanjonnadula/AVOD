//
//  FetchHomePageUseCase.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import Foundation

protocol FetchHomePageUseCaseProtocol {
    func execute() async throws -> AVODHomePage
}

struct FetchHomePageUseCase: FetchHomePageUseCaseProtocol {
    
    let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func execute() async throws -> AVODHomePage {
        return try await homeRepository.fetchHomePage()
    }
    
}
