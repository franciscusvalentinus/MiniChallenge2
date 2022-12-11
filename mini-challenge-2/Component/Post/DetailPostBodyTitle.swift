//
//  DetailPostBodyTitle.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 24/06/22.
//

import NukeUI
import SwiftUI

struct DetailPostBodyTitle: View {
    var reviewImageString: [String]
    var foodName: String
    var rating: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(reviewImageString, id: \.self) { image in
//                    AsyncImage(url: URL(string: image)) { image in
//                        image.resizable()
//                    } placeholder: {
//                        Text("")
//                    }
                    LazyImage(source: URL(string: image))
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                        .cornerRadius(10)
                }
            }
        }

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
