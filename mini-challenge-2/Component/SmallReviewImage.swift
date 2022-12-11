//
//  SmallReviewImage.swift
//  mini-challenge-2
//
//  Created by William on 19/07/22.
//

import SwiftUI

struct SmallReviewImage: View {
    var image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 150)
            .clipped()
            .cornerRadius(10)
    }
}
