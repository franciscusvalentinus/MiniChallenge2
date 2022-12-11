//
//  ReviewViewModel.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//

import Foundation

final class ReviewViewModel: ObservableObject {
    var authState: AuthState?
    var filterModel: FilterModel?
    
    @Published var reviews: [Review] = []
    @Published var hasError = false
    @Published var isLoading = false
    
    /** Track old url to minimize fetching for filter */
    @Published var _oldURL = ""
    
    func setup(_ authState: AuthState, _ filterModel: FilterModel) {
        self.authState = authState
        self.filterModel = filterModel
    }
    
    func getReviewURLWithFilter() -> String {
        var queryItems: [URLQueryItem] = []
        
        if filterModel?.rating == .SELECTED_4 {
            queryItems.append(URLQueryItem(name: "rating", value: "4"))
        } else if filterModel?.rating == .SELECTED_5 {
            queryItems.append(URLQueryItem(name: "rating", value: "5"))
        }
        
        var urlComps = URLComponents(string: RemoteURL.review)!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
        return result.absoluteString
    }

    func fetchReviews() {
        Task { @MainActor in
            do {
                let url = getReviewURLWithFilter()
                if reviews.isEmpty {
                    isLoading = true
                }
                let reviewResponse = try await RemoteDataService().getData(APIReturn<[Review]>.self, url: url, token: authState?.token)
                
                _oldURL = url
                reviews = reviewResponse.data
                hasError = false
                isLoading = false
            } catch {
                hasError = true
                isLoading = false
                print("Error \(error.localizedDescription)")
                print(String(describing: error))
            }
        }
    }
}
