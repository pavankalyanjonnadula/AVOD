//
//  FetchHomePageUseCaseTests.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import XCTest
@testable import AVOD

// MARK: - Mock Repository
class MockHomeRepository: HomeRepositoryProtocol {
    
    var shouldThrowError = false
    var errorToThrow: Error?
    var mockResponse: AVODHomePage?
    var fetchHomePageCallCount = 0  // Track if method was called
    
    func fetchHomePage() async throws -> AVODHomePage {
        fetchHomePageCallCount += 1
        
        if shouldThrowError {
            throw errorToThrow ?? NetworkError.noData
        }
        
        guard let response = mockResponse else {
            throw NetworkError.noData
        }
        
        return response
    }
}

// MARK: - Tests
@MainActor
final class FetchHomePageUseCaseTests: XCTestCase {
    
    var sut: FetchHomePageUseCase!
    var mockRepository: MockHomeRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockHomeRepository()
        sut = FetchHomePageUseCase(homeRepository: mockRepository)
    }
    
    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }
    
    // MARK: - Test Cases
    
    // Test 1: Success case
    func testExecute_Success_ReturnsAVODHomePage() async throws {
        // Given: Mock successful response
        let expectedResponse = TestModelFactory.createMockAVODHomePage(pageName: "UseCase Test")!
        mockRepository.mockResponse = expectedResponse
        
        // When: Execute use case
        let result = try await sut.execute()
        
        // Then: Verify result and repository was called
        XCTAssertNotNil(result)
        XCTAssertEqual(result.record?.page?.name, "UseCase Test")
        XCTAssertEqual(mockRepository.fetchHomePageCallCount, 1)
    }
    
    // Test 2: Repository error
    func testExecute_RepositoryError_ThrowsError() async throws {
        // Given: Mock repository error
        mockRepository.shouldThrowError = true
        mockRepository.errorToThrow = NetworkError.noData
        
        // When & Then: Verify error is thrown
        do {
            _ = try await sut.execute()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is NetworkError)
            XCTAssertEqual(mockRepository.fetchHomePageCallCount, 1)
        }
    }
    
    // Test 3: Verify repository is called
    func testExecute_CallsRepository() async throws {
        // Given: Mock response
        let mockResponse = TestModelFactory.createMockAVODHomePage()!
        mockRepository.mockResponse = mockResponse
        
        // When: Execute
        _ = try await sut.execute()
        
        // Then: Verify repository was called exactly once
        XCTAssertEqual(mockRepository.fetchHomePageCallCount, 1)
    }
}
