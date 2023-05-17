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
    
    private var service: APIService
    
    init(service: APIService = APIServiceConcrete()) {
        self.service = service
    }
    
    func getPersons() {
        isloading = true
        
        service.fetch { [unowned self] result in
            isloading = false
            switch result {
            case .success(let successResponse):
                self.persons = successResponse
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
            }
        }
    }
}
