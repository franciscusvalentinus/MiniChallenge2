//
//  PostBodyStruct.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

// Post Body
struct PostBody: View {
    var reviewImageString: String
    var foodName: String
    var rating: Int
    var restaurantName: String
    var reviewDescription: String
    var price: Int
    var platform: String
    var body: some View {
        PostBodyTitle(reviewImageString: reviewImageString, foodName: foodName, rating: rating)

        Text(reviewDescription)
            .font(.system(size: 16, weight: .regular, design: .default))
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .foregroundColor(.primary)

        SFIconAndText(SFimageName: "paperplane", imageWidth: 20, imageHeight: 20, textDisplay: restaurantName)
            .padding(.top, 5)
            .padding(.bottom, 0)

        let nh = NumberFormatting()
        let fda = FDA()
        SFIconAndText(SFimageName: "dollarsign.circle", imageWidth: 20, imageHeight: 20, textDisplay: nh.integerToRupiahString(numberToConvert: price) + " di " + fda.getCompleteFDAString(fda: platform))
            .padding(.bottom, 0)
    }
}
