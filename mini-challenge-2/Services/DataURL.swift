//
//  DataURL.swift
//  mini-challenge-2
//
//  Created by Dimas A. Prabowo on 26/10/21.
//  Modified by Clarence

import Foundation

enum LocalFile: String {
    case regions
}

enum RemoteURL {
    private static let baseRoute = "https://apple-mc2-rest.yagrariksa.site/api"

    static let review = baseRoute + "/review"
    static let login = baseRoute + "/login"
    static let register = baseRoute + "/register"
    static let test = baseRoute + "/test"
    static func detailReview(_ id: Int) -> String {
        return baseRoute + "/review/\(id)"
    }
    static let restaurant = baseRoute + "/restaurant"
    static func restaurantReview(_ id: Int) -> String {
        return baseRoute + "/restaurant/\(id)"
    }

    static let userReview = baseRoute + "/review/my"
//    static func userReviews() -> String {
//        return baseRoute + "/review/my"
//    }
}
