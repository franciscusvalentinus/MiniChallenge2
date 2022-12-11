//
//  RestaurantReviews.swift
//  mini-challenge-2
//
//  Created by William on 15/07/22.
//

import Foundation

struct RestaurantReviews: Codable{
    let id: Int
    let name: String
    let location: String
    let district: String
    let foods: [FoodFromRestaurant]
}

struct FoodFromRestaurant: Codable{
    let id: Int
    let name: String
    let reviews: [ReviewFromRestaurant]
}

struct ReviewFromRestaurant:Codable{
    let id: Int
    let desc: String
    var rating: Int
    let price: Int
    let FDA: String
    
    let created_at: String
    let updated_at: String
    let porsi: String
    let images: [String]

    let user: User
    let url: APIUrl
}
