//
//  ProfileViewModel.swift
//  mini-challenge-2
//
//  Created by William on 29/06/22.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    var authState: AuthState?
    @Published var userReview: [Review]?

    func setup(_ authState: AuthState) {
        self.authState = authState
    }

    func fetchUserReview() {
        Task { @MainActor in
            do {
                let userReviewResponse = try await RemoteDataService().getData(APIReturn<[Review]>.self, url: RemoteURL.userReview, token: authState?.token)
                userReview = userReviewResponse.data
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
