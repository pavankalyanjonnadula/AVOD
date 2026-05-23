//
//  HomeRepositoryTests.swift
//  AVODTests
//
//  Created by pajonn on 23/05/26.
//

import XCTest
@testable import AVOD

// MARK: - Mock Network Service
class MockNetworkService: NetworkServiceProtocol {
    
    var shouldThrowError = false
    var errorToThrow: Error?
    var mockResponse: AVODHomePage?
    
    func getData<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        if shouldThrowError {
            throw errorToThrow ?? NetworkError.noData
        }
        
        if let response = mockResponse as? T {
            return response
        }
        
        throw NetworkError.decodingError(NSError(domain: "Mock", code: 0))
    }
}

// MARK: - Tests
@MainActor
final class HomeRepositoryTests: XCTestCase {
    
    var sut: HomeRepository!  // System Under Test
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = HomeRepository(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    // MARK: - Test Cases
    
    // Test 1: Success case
    func testFetchHomePage_Success_ReturnsAVODHomePage() async throws {
        // Given: Mock successful response using factory
        let expectedResponse = TestModelFactory.createMockAVODHomePage(pageName: "Home")!
        mockNetworkService.mockResponse = expectedResponse
        
        // When: Fetch home page
        let result = try await sut.fetchHomePage()
        
        // Then: Verify result
        XCTAssertNotNil(result)
        XCTAssertEqual(result.record?.page?.name, "Home")
        XCTAssertNotNil(result.metadata)
    }
    
    // Test 2: Network error
    func testFetchHomePage_NetworkError_ThrowsError() async throws {
        // Given: Mock network error
        mockNetworkService.shouldThrowError = true
        mockNetworkService.errorToThrow = NetworkError.noData
        
        // When & Then: Verify error is thrown
        do {
            _ = try await sut.fetchHomePage()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
    
    // Test 3: Invalid URL
    func testFetchHomePage_ValidURL_ReturnsData() async throws {
        // Given: Mock response
        let mockResponse = TestModelFactory.createMockAVODHomePage()!
        mockNetworkService.mockResponse = mockResponse
        
        // When: Fetch data
        let result = try await sut.fetchHomePage()
        
        // Then: Verify
        XCTAssertNotNil(result)
    }

}
