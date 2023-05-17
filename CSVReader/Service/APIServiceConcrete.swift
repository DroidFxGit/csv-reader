//
//  APIServiceConcrete.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 16/05/23.
//

import Foundation

protocol APIService: AnyObject {
    func fetch(completion: @escaping ((Result<[Person], ErrorReader>) -> Void))
}

final class APIServiceConcrete: APIService {
    func fetch(completion: @escaping ((Result<[Person], ErrorReader>) -> Void)) {
        do {
            let result = try BundleReader.getPersonArray(for: .issues)
            completion(.success(result))
        } catch {
            if let customError = error as? ErrorReader {
                completion(.failure(customError))
            }
        }
    }
}
