//
//  BundleReader.swift
//  CSVReader
//
//  Created by Carlos Vázquez Gómez on 15/05/23.
//

import Foundation

enum ErrorReader: Error, CustomStringConvertible {
    case notFound(String)
    case badStructure(error: Error)
    
    var localizedDescription: String {
        switch self {
        case .notFound(let notFound):
            return notFound
        case .badStructure(let error):
            return error.localizedDescription
        }
    }
    
    var description: String {
        switch self {
        case .notFound:
            return "Not Found"
        case .badStructure:
            return "Bad structure"
        }
    }
}

enum BundleFile: String {
    case issues
    
    var extensionFile: String {
        switch self {
        case .issues:
            return "csv"
        }
    }
}

struct BundleReader {
    static func getPersonArray(for file: BundleFile) throws -> [Person] {
        guard let filepath = Bundle.main.path(forResource: file.rawValue,
                                              ofType: file.extensionFile) else {
            throw ErrorReader.notFound("file .csv not found")
        }
        
        var data = ""
        do {
            data = try String(contentsOfFile: filepath, encoding: .utf8)
        } catch {
            throw ErrorReader.badStructure(error: error)
        }
        
        var rows = data.components(separatedBy: "\n")
        let numberOfColumns = rows[0].components(separatedBy: ",")
        
        rows.removeFirst()
        let cleanedRows = rows.map { value in
            return value.replacingOccurrences(of: "\"", with: "", options: .literal)
        }
        
        let persons = cleanedRows.compactMap { value in
            let columns = value.components(separatedBy: ",")
            if columns.count == numberOfColumns.count {
                return Person(firstName: columns[0],
                              surname: columns[1],
                              issueCount: Int(columns[2]) ?? 0,
                              dateBirth: columns[3])
            }
            return nil
        }
        
        return persons
    }
}
