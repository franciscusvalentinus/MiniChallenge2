//
//  LocalServiceError.swift
//  mini-challenge-2
//
//  Created by Dimas A. Prabowo on 02/11/21.
//  Modified by Clarence

import Foundation

enum LocalServiceError: Error {
    case badPath
    case badData
}

extension LocalServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badPath:
            return NSLocalizedString("No such file found in your directory", comment: "")
        case .badData:
            return NSLocalizedString("File data can't be decoded to json format", comment: "")
        }
    }
}
