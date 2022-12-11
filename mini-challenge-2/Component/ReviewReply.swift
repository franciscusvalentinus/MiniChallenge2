//
//  ReviewReply.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct ReviewReply: View {
    var profileImage: String
    var userDisplayName: String
    var userRole: String
    var reviewDate: String
    var userComment: String
    var body: some View {
        VStack(alignment: .leading) {
            PostHeader(profileImageString: profileImage, userDisplayName: userDisplayName, userRole: userRole, reviewDate: reviewDate)
            Text(userComment)
        }
    }
}
