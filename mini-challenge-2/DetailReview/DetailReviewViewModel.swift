//
//  DetailReviewViewModel.swift
//  mini-challenge-2
//
//  Created by Clarence on 24/06/22.
//

import Foundation

final class DetailReviewViewModel: ObservableObject {
    var reviewId: Int?
    var authState: AuthState?
    @Published var review: Review?
    @Published var sameRestaurantReviews: RestaurantReviews?

    func setup(_ authState: AuthState, reviewId: Int) {
        self.authState = authState
        self.reviewId = reviewId
    }

    func fetchReview(id: Int) {
        Task { @MainActor in
            do {
                let reviewResponse = try await RemoteDataService().getData(APIReturn<Review>.self, url: RemoteURL.detailReview(id), token: authState?.token)
                review = reviewResponse.data

                let sameRestaurantReviewResponse = try await RemoteDataService().getData(APIReturn<RestaurantReviews>.self, url: RemoteURL.restaurantReview((review?.food.restaurant.id)!), token: authState?.token)
                sameRestaurantReviews = sameRestaurantReviewResponse.data
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
    }

    func postComment(comment: String) {
        print("Comment: \(comment)")
        print("Review Id: \(String(describing: reviewId))")
    }
}
