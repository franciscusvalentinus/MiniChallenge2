//
//  FilterModel.swift
//  mini-challenge-2
//
//  Created by Clarence on 11/07/22.
//

import Foundation

enum RatingState {
    case NO_RATING
    case SELECTED_4
    case SELECTED_5
}

class FilterModel: ObservableObject {
    @Published var rating: RatingState = .NO_RATING
    
    @Published var platform_gofood: Bool = false
    @Published var platform_grabfood: Bool = false
    @Published var platform_shopeefood: Bool = false
    @Published var platform_travelokaeats: Bool = false
    
    @Published var priceRange1: Bool = false
    @Published var priceRange2: Bool = false
    @Published var priceRange3: Bool = false
    @Published var priceRange4: Bool = false
    
    func clearFilters() {
        rating = .NO_RATING
        platform_gofood = false
        platform_grabfood = false
        platform_shopeefood = false
        platform_travelokaeats = false
        priceRange1 = false
        priceRange2 = false
        priceRange3 = false
        priceRange4 = false
    }
}
