//
//  PostTractionStruct.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

// Post Traction (Like and Dislikes)
struct PostTraction: View {
    // Nanti binding
    var ratingCount: Int
    var body: some View {
        HStack {
            Spacer()
            Button {
                // Nanti counter
            } label: {
                Image(systemName: "hand.thumbsup")
                    .renderingMode(.original)
            }
            Text(String(ratingCount >= 0 ? "+" : "") + String(ratingCount))
                .foregroundColor(ratingCount >= 0 ? .green : .red)
            Button {
                // Nanti counter
            } label: {
                Image(systemName: "hand.thumbsdown")
                    .renderingMode(.original)
            }
        }
        .padding(.bottom, 20)
    }
}
