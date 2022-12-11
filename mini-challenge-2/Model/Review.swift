//
//  Review.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//

import Foundation

struct Review: Codable, Identifiable {
    let id: Int
    let desc: String
    var rating: Int
    let price: Int
    let FDA: String
    let url: APIUrl
    let porsi: String
    /** ISO8601 Format */
    let created_at: String
    let images: [String]

    let food: Food
    let user: User

    var created_date: Date {
        return Date.getDateFromString(dateString: created_at)!
    }
}
