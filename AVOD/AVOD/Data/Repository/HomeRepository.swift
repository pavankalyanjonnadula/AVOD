//
//  HomeRepository.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import Foundation

protocol HomeRepositoryProtocol {
    func fetchHomePage() async throws -> AVODHomePage
}

struct HomeRepository: HomeRepositoryProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchHomePage() async throws -> AVODHomePage {
        guard let url = URL(string: "https://api.jsonbin.io/v3/b/69df608e36566621a8b675e1") else {
            throw NetworkError.invalidURL
        }
        let homePageData: AVODHomePage = try await networkService.getData(urlRequest: URLRequest(url: url))
        return homePageData
    }
}
