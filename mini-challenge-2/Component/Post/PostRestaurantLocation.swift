//
//  PostRestaurantLocation.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct PostRestaurantLocation: View {
    var restaurantName: String
    var restaurantLocation: String
    var body: some View {
        HStack {
            Image("location-pin")
                .resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(restaurantName)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                Text(restaurantLocation)
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}
