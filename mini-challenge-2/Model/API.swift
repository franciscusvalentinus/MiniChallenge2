//
//  Api.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//

import Foundation

struct APIReturn<T: Codable>: Codable {
    let message: String
    let data: T
}

struct APIUrl: Codable {
    let all: String
    let details: String
}
