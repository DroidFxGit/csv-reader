//
//  MainViewModel.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var persons: [Person] = []
    @Published var isloading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        isloading = true
        getPersons()
    }
    
    func getPersons() {
        isloading = true
        do {
            persons = try BundleReader.getPersonArray(for: .issues)
            errorMessage = nil
            isloading = false
        } catch {
            if let customError = error as? ErrorReader {
                errorMessage = customError.localizedDescription
            }
            isloading = false
        }
    }
}
