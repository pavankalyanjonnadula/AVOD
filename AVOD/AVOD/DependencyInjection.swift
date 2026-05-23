//
//  DependencyInjection.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    // MARK: - Network Layer
    func makeNetworkService() -> NetworkServiceProtocol {
        return NetworkService()
    }
    
    // MARK: - Repository Layer
    func makeHomeRepository() -> HomeRepositoryProtocol {
        return HomeRepository(networkService: makeNetworkService())
    }
    
    // MARK: - Use Case Layer
    func makeFetchHomePageUseCase() -> FetchHomePageUseCaseProtocol {
        return FetchHomePageUseCase(homeRepository: makeHomeRepository())
    }
    
    // MARK: - ViewModel Layer
    func makeHomePageViewModel() -> HomePageViewModel {
        return HomePageViewModel(fetchHomePageUseCase: makeFetchHomePageUseCase())
    }
}
