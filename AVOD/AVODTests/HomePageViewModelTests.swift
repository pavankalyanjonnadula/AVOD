//
//  HomePageViewModelTests.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//
import XCTest
@testable import AVOD

// MARK: - Mock UseCase
class MockFetchHomePageUseCase: FetchHomePageUseCaseProtocol {
    
    var shouldThrowError = false
    var errorToThrow: Error?
    var mockResponse: AVODHomePage?
    var executeCallCount = 0
    
    func execute() async throws -> AVODHomePage {
        executeCallCount += 1
        
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
final class HomePageViewModelTests: XCTestCase {
    
    var sut: HomePageViewModel!
    var mockUseCase: MockFetchHomePageUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchHomePageUseCase()
        sut = HomePageViewModel(fetchHomePageUseCase: mockUseCase)
    }
    
    override func tearDown() {
        sut = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    // MARK: - Test Cases
    
    // Test 1: Initial state
    func testInitialState() {
        // Then: Verify initial state
        XCTAssertNil(sut.homePageData)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.errorMessage)
    }
    
    // Test 2: Success - Data is loaded
    func testFetchHomePage_Success_UpdatesData() async {
        // Given: Mock successful response
        let expectedResponse = TestModelFactory.createMockAVODHomePage(pageName: "ViewModel Test")!
        mockUseCase.mockResponse = expectedResponse
        
        // When: Fetch home page
        await sut.fetchHomePage()
        
        // Then: Verify state
        XCTAssertNotNil(sut.homePageData)
        XCTAssertEqual(sut.homePageData?.record?.page?.name, "ViewModel Test")
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.errorMessage)
        XCTAssertEqual(mockUseCase.executeCallCount, 1)
    }
    
    // Test 3: Error - Error message is set
    func testFetchHomePage_Error_SetsErrorMessage() async {
        // Given: Mock error
        mockUseCase.shouldThrowError = true
        mockUseCase.errorToThrow = NetworkError.noData
        
        // When: Fetch home page
        await sut.fetchHomePage()
        
        // Then: Verify error state
        XCTAssertNil(sut.homePageData)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNotNil(sut.errorMessage)
        XCTAssertEqual(mockUseCase.executeCallCount, 1)
    }
    
    // Test 4: Loading state during fetch
    func testFetchHomePage_SetsLoadingState() async {
        // Given: Mock response with delay
        let expectedResponse = TestModelFactory.createMockAVODHomePage()!
        mockUseCase.mockResponse = expectedResponse
        
        // When: Start fetching (but don't await yet)
        let fetchTask = Task {
            await sut.fetchHomePage()
        }
        
        // Then: Loading should be true initially
        // Note: This is tricky to test reliably due to timing
        // In a real scenario, you might use Task sleep to verify
        
        await fetchTask.value
        
        // After completion, loading should be false
        XCTAssertFalse(sut.isLoading)
    }
    
    // Test 5: Previous error is cleared on new fetch
    func testFetchHomePage_ClearsPreviousError() async {
        // Given: First fetch fails
        mockUseCase.shouldThrowError = true
        mockUseCase.errorToThrow = NetworkError.noData
        await sut.fetchHomePage()
        XCTAssertNotNil(sut.errorMessage)
        
        // When: Second fetch succeeds
        mockUseCase.shouldThrowError = false
        mockUseCase.mockResponse = TestModelFactory.createMockAVODHomePage()!
        await sut.fetchHomePage()
        
        // Then: Error should be cleared
        XCTAssertNil(sut.errorMessage)
        XCTAssertNotNil(sut.homePageData)
    }
    
    // Test 6: UseCase is called
    func testFetchHomePage_CallsUseCase() async {
        // Given: Mock response
        mockUseCase.mockResponse = TestModelFactory.createMockAVODHomePage()!
        
        // When: Fetch
        await sut.fetchHomePage()
        
        // Then: UseCase was called
        XCTAssertEqual(mockUseCase.executeCallCount, 1)
    }
}
