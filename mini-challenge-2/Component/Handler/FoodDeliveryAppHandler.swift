//
//  FoodDeliveryAppHandler.swift
//  mini-challenge-2
//
//  Created by William on 25/06/22.
//

import SwiftUI

class FDA {
    func getCompleteFDAString(fda: String) -> String {
        switch fda.lowercased() {
            case "gofood":
                return "GoFood"
            case "grabfood":
                return "GrabFood"
            case "shopeefood":
                return "ShopeeFood"
            case "travelokafood":
                return "Traveloka Eats"
            default:
                return fda
        }
    }

    static let keys = ["gofood", "grabfood", "shopeefood", "travelokafood"]
}
