//
//  OtherReviewCard.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import NukeUI
import SwiftUI

struct OtherReviewCard: View, Hashable {
    var foodImage: String
    var foodName: String
    var profileImage: String
    var userDisplayName: String
    var userRating: Int
    var body: some View {
        VStack(alignment: .leading) {
//            AsyncImage(url: URL(string: foodImage)) { image in
//                image.resizable()
//            } placeholder: {
//                Text("")
//            }
            LazyImage(source: URL(string: foodImage))
                .frame(width: 200, height: 200)
                .cornerRadius(10)

            Text(foodName)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.primary)
            HStack {
//                AsyncImage(url: URL(string: profileImage)) { image in
//                    image.resizable()
//                } placeholder: {
//                    Text("")
//                }
                LazyImage(source: URL(string: profileImage))
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipped()
                    .cornerRadius(10)

                Text(userDisplayName)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "star.fill")
                    .renderingMode(.template)
                    .foregroundColor(.orange)
                    .frame(width: 10, height: 10)
                Text(String(userRating))
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.orange)
            }
            .frame(width: 200)
        }
    }
}
