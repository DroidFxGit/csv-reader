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
        if viewModel.isloading {
            LoadingView()
        } else if viewModel.errorMessage != nil {
            ErrorView(viewModel: viewModel)
        } else {
            PersonListView(persons: viewModel.persons)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
