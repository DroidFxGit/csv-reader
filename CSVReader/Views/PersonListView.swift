//
//  PersonListView.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import SwiftUI

struct PersonListView: View {
    let persons: [Person]
    var body: some View {
        List {
            ForEach(persons) { person in
                VStack(alignment: .leading) {
                    Text(person.fullName)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    HStack {
                        Text("Issue Count:")
                        Text("\(person.issueCount)")
                            .foregroundColor(.black)
                            .font(.headline)
                    }

                    HStack {
                        Text("Birthdate:")
                        Text("\(person.formattedDate)")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(persons: [.init(firstName: "Carlos",
                                       surname: "Vazquez",
                                       issueCount: 1,
                                       dateBirth: "1978-01-02T00:00:00")])
    }
}
