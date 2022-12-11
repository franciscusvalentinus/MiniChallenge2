//
//  PostDetailReview.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct PostDetailReview: View {
    var foodPrice: Int
    var FDAPlaform: String
    var foodPortion: String
    var foodReview: Int
    let columns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.flexible()),
    ]
    var body: some View {
        HStack {
            Text("Penilaian")
                .multilineTextAlignment(.leading)
                .font(.system(size: 20, weight: .semibold, design: .default))
            Spacer()
        }
        LazyVGrid(columns: columns) {
            HStack {
                Text("Harga")
                Spacer()
            }
            HStack {
                let numberFormatting = NumberFormatting()
                Text(numberFormatting.integerToRupiahString(numberToConvert: foodPrice))
                Spacer()
            }
        }

        Text("Harga yang digunakan merupakan harga setelah diskon dan ongkir")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 12, weight: .regular, design: .default))
            .foregroundColor(.gray)
        LazyVGrid(columns: columns) {
            HStack {
                Text("Platform")
                Spacer()
            }
            HStack(alignment: .center) {
                Image(FDAPlaform.lowercased())
                    .resizable()
                    .frame(width: 30, height: 30)
                let fda = FDA()
                Text(fda.getCompleteFDAString(fda: FDAPlaform))
                Spacer()
            }
        }
        LazyVGrid(columns: columns) {
            HStack {
                Text("Besar Porsi")
                Spacer()
            }
            HStack {
                let portion = Portion()
                Text(portion.getPortionString(portion: foodPortion))
                Spacer()
            }
        }
        LazyVGrid(columns: columns) {
            HStack {
                Text("Rating")
                Spacer()
            }
            HStack {
                let review = ReviewHandler()
                Text(review.getReviewConvertedString(review: foodReview))
                Spacer()
            }
        }
    }
}
