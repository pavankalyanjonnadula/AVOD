//
//  NetworkService.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T
}


enum NetworkError: Error {
    case invalidURL
    case noData
    case invalidResponse(statusCode: Int)  // capture the status code
    case decodingError(Error)  // capture underlying error
    case networkError(Error)   // for URLSession errors
}


struct NetworkService: NetworkServiceProtocol {
    
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T{
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse(statusCode: 0)
            }
            guard httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse(statusCode: httpResponse.statusCode)
            }
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch let error as DecodingError {
            throw NetworkError.decodingError(error)
        } catch {
            throw NetworkError.networkError(error)
        }
    }
    
}
