//
//  ErrorView.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        VStack {
            Image(systemName: "person.fill.xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding()
            
            Text(viewModel.errorMessage ?? "")
                .foregroundColor(.gray)
                .padding()
            
            Button("Try again") {
                viewModel.getPersons()
            }
            .foregroundColor(.white)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: MainViewModel())
    }
}
