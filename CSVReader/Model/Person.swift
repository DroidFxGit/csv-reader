//
//  Person.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let firstName: String
    let surname: String
    let issueCount: Int
    let dateBirth: String
}

extension Person {
    var fullName: String {
        return firstName + " " + surname
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let cleanedDateString = dateBirth.replacingOccurrences(of: "\r", with: "")
        guard let date = dateFormatter.date(from: cleanedDateString) else {
            return ""
        }
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date).capitalized
    }
}