//
//  APIServiceMock.swift
//  CSVReaderTests
//
//  Created by Carlos Vázquez Gómez on 16/05/23.
//

import Foundation
@testable import CSVReader

final class APIServiceMock: APIService {
    var mockedError: ErrorReader?
    func fetch(completion: @escaping ((Result<[Person], ErrorReader>) -> Void)) {
        if let mockedError = mockedError {
            completion(.failure(mockedError))
        } else {
            completion(.success([.mockExample]))
        }
    }
}
