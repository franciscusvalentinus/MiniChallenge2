//
//  PostIconTextStruct.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

// View for Icon and Text side by side
struct SFIconAndText: View {
    var SFimageName: String
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var textDisplay: String
    var body: some View {
        HStack {
            Image(systemName: SFimageName)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(.gray)
            Text(textDisplay)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}
