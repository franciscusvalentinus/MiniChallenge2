//
//  PostBodyTitle.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import NukeUI
import SwiftUI

struct PostBodyTitle: View {
    var reviewImageString: String
    var foodName: String
    var rating: Int
    var body: some View {
//        AsyncImage(url: URL(string: reviewImageString)) { image in
//            image.resizable()
//        } placeholder: {
//            Text("")
//        }
//        .scaledToFill()
//        .frame(width: UIScreen.main.bounds.width - 30, height: 300)
//        .clipped()
//        .cornerRadius(10)
        LazyImage(source: URL(string: reviewImageString))
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width - 30, height: 300)
            .clipped()
            .cornerRadius(10)

        HStack {
            Text(foodName)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 2)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "star.fill")
                .renderingMode(.template)
                .foregroundColor(.orange)
            Text(String(rating))
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.orange)
        }
    }
}
