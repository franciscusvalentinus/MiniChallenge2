//
//  OtherReviews.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct OtherReviews: View {
    var restaurantName: String
    var restaurantReviews: RestaurantReviews?
    var currentId: Int
    var body: some View {
        if let restaurantReviews = restaurantReviews {
            if restaurantReviews.foods.count > 0 {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Review lain restoran")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.primary)
                        Text(restaurantName)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        print("Lihat Lainnya")
                    } label: {
                        Text("Lihat lainnya")
                        Image(systemName: "arrow.right")
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(restaurantReviews.foods, id: \.name) { food in
                            ForEach(food.reviews, id: \.id) { review in
                                if currentId != review.id {
                                    NavigationLink(destination: DetailReviewView(id: review.id)) {
                                        OtherReviewCard(foodImage: review.images[0], foodName: food.name, profileImage: review.user.image, userDisplayName: review.user.name, userRating: review.rating)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
