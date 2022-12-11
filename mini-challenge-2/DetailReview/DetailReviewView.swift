//
//  DetailReviewView.swift
//  mini-challenge-2
//
//  Created by Clarence on 24/06/22.
//

import SwiftUI

struct DetailReviewView: View {
    var id: Int

    @StateObject private var vm = DetailReviewViewModel()
    @EnvironmentObject var authState: AuthState

    var body: some View {
        VStack {
            if let review = vm.review {
                ScrollView(showsIndicators: false) {
                    VStack {
                        PostHeader(profileImageString: review.user.image, userDisplayName: review.user.name, userRole: review.user.role, reviewDate: Date.getStringFromDate(date: review.created_date, .date))
                        DetailPostBodyTitle(reviewImageString: review.images, foodName: review.food.name, rating: review.rating)
                        PostDetailReview(foodPrice: review.price, FDAPlaform: review.FDA, foodPortion: review.porsi, foodReview: review.rating)
                        PostRestaurantLocation(restaurantName: review.food.restaurant.name, restaurantLocation: review.food.restaurant.location)
                            .padding(.bottom, 10)
                        Divider()
                            .padding([.bottom])
                        // Needs to be revisited for more replies
                        ReviewReply(profileImage: review.user.image, userDisplayName: review.user.name, userRole: review.user.role, reviewDate: Date.getStringFromDate(date: review.created_date, .date), userComment: review.desc)
                            .padding(.bottom, 10)
                        CommentSection(buttonAction: vm.postComment)
                            .padding(.top)
                        Divider()
                            .padding([.bottom, .top])
                            .padding([.bottom, .top])
                        OtherReviews(restaurantName: review.food.restaurant.name, restaurantReviews: vm.sameRestaurantReviews, currentId: (vm.review?.id)!)
                            .padding(.top, 10)
                    }
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                .padding(.horizontal)
            } else {
//                Text("Review not found")
            }
        }
        .onAppear {
            vm.setup(authState, reviewId: id)
            vm.fetchReview(id: id)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailReviewView_Previews: PreviewProvider {
    static var previews: some View {
        DetailReviewView(id: 1)
            .environmentObject(AuthState())
    }
}
