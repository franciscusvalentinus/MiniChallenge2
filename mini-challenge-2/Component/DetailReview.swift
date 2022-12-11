//
//  DetailReview.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct DetailReview: View {
    @State var textFieldString: String = ""
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    PostHeader(profileImageString: "profile_picture", userDisplayName: "Gunawan", userRole: "Anak Kos", reviewDate: "22 Juni 2022")
                    DetailPostBodyTitle(reviewImageString: ["no_peace", "no_peace", "no_peace", "no_peace"], foodName: "Nasi Sakit Hati", rating: "4")
                    PostDetailReview(foodPrice: 100_000, FDAPlaform: "GoFood", foodPortion: BesarPorsi.pas, foodReview: UserReview.nyeselbeli)
                    PostRestaurantLocation(restaurantName: "Dapoer Mantab", restaurantLocation: "Jl. Setia Budi No. 35, Sambikerep, Made, Surabaya")
                        .padding(.bottom, 30)
                    Divider()
                        .padding([.bottom, .top])
                    ReviewReply(profileImage: "profile_picture", userDisplayName: "Gunawan", userRole: "Anak Kos", reviewDate: "22 Juni 2022", userComment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis praesent eget aliquam sed tortor nunc et. Molestie mi pulvinar turpis pellentesque commodo egestas ultrices malesuada dictum!")
                        .padding(.bottom, 10)
                    Divider()
                        .padding([.bottom, .top])
                    ReviewReply(profileImage: "profile_picture", userDisplayName: "Gunawan", userRole: "Anak Kos", reviewDate: "22 Juni 2022", userComment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis praesent eget aliquam sed tortor nunc et. Molestie mi pulvinar turpis pellentesque commodo egestas ultrices malesuada dictum!")
                    Divider()
                        .padding([.bottom, .top])
                    OtherReviews()
                        .padding(.top, 10)
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .padding(.trailing)
            .padding(.leading)
            .padding(.bottom, 100)
            VStack {
                Spacer()
                WriteCommentForm(textFieldString: $textFieldString)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailReview_Previews: PreviewProvider {
    static var previews: some View {
        DetailReview()
    }
}
