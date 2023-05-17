//
//  ContentView.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isloading {
                LoadingView()
            } else if viewModel.errorMessage != nil {
                ErrorView(viewModel: viewModel)
            } else {
                PersonListView(persons: viewModel.persons)
            }
        }.onAppear {
            viewModel.isloading = true
            //option can be executed directly, just simulates a heavy task
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewModel.getPersons()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
