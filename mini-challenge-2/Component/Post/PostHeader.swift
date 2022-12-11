//
//  PostHeaderStruct.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import NukeUI
import SwiftUI

// Struct for Views
// Post Header (Profile Picture, Name, Role and Date)
struct PostHeader: View {
    var profileImageString: String
    var userDisplayName: String
    var userRole: String
    var reviewDate: String
    var body: some View {
        HStack {
//            AsyncImage(url: URL(string: profileImageString)) { image in
//                image.resizable()
//            } placeholder: {
//                Text("")
//            }
            LazyImage(source: profileImageString)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(userDisplayName)
                    .font(.system(size: 16, weight: .bold, design: .default))
                Text(userRole)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(reviewDate)
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(.gray)
        }
    }
}
