//
//  Restaurant.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//

import Foundation

struct Restaurant: Codable {
    let id: Int
    let name: String
    let location: String
    let district: String
    let url: APIUrl
}
