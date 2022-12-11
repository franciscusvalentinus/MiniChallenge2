//
//  LocalDataServices.swift
//  mini-challenge-2
//
//  Created by Dimas A. Prabowo on 25/10/21.
//  Modified by Clarence

import Foundation
import UIKit

class LocalDataService {
    /// Read data from local directory file.
    ///
    /// - returns: Data that have decoded to specific object/structure from local directory.
    /// - throws: An error if file path not found.
    /// - throws: An error when data can't be get in json format using utf8 encoding.
    /// - throws: An error if any value throws an error during decoding.
    func readFile<T: Codable>(_ type: T.Type, from fileName: LocalFile) throws -> T {
        guard let bundlePath = Bundle.main.path(forResource: fileName.rawValue, ofType: "json") else { throw LocalServiceError.badPath }
        guard let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else { throw LocalServiceError.badData }
        let data = try JSONDecoder().decode(type, from: jsonData)
        return data
    }
}
