//
//  MainViewModelTests.swift
//  CSVReaderTests
//
//  Created by Carlos Vázquez Gómez on 16/05/23.
//

import XCTest
@testable import CSVReader

enum Error: Swift.Error, Equatable {
    case emptyText
}

final class MainViewModelTests: XCTestCase {
    
    override func tearDown() {
    }

    func testThatViewModelFetchesInfoSuccessfully() throws {
        let mockedService = APIServiceMock()
        let viewModel = MainViewModel(service: mockedService)
        let expectation = XCTestExpectation(description: "get persons from service")
        viewModel.getPersons()
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 0.5)
        XCTAssert(!viewModel.persons.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testThatViewModelFetchThrowsErrorWhenFileIsNotFound() throws {
        let mockedService = APIServiceMock()
        let expectedMessage = "file not found"
        mockedService.mockedError = ErrorReader.notFound(expectedMessage)
        
        let viewModel = MainViewModel(service: mockedService)
        let expectation = XCTestExpectation(description: "get persons from service")
        viewModel.getPersons()
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 0.5)
        XCTAssert(viewModel.errorMessage == expectedMessage)
        XCTAssertTrue(viewModel.persons.isEmpty)
    }
    
    func testThatViewModelFetchThrowsErrorWhenInfoIsCorrupted() throws {
        let mockedService = APIServiceMock()
        let mockedError = Error.emptyText
        mockedService.mockedError = ErrorReader.badStructure(error: mockedError)
        
        let viewModel = MainViewModel(service: mockedService)
        let expectation = XCTestExpectation(description: "get persons from service")
        viewModel.getPersons()
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 0.5)
        XCTAssert(viewModel.errorMessage != nil)
        XCTAssertTrue(viewModel.persons.isEmpty)
    }
}
