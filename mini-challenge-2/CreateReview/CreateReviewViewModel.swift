//
//  CreateReviewViewModel.swift
//  mini-challenge-2
//
//  Created by William & Clarence on 19/07/22.
//

import SwiftUI
import SwiftyJSON

final class CreateReviewViewModel: ObservableObject {
    var authState: AuthState?
    @Published var restaurantReviews: [RestaurantReviews] = []
    @Published var restaurantList: [String] = []

    func setup(_ authState: AuthState) {
        self.authState = authState
    }

    func create(images: [UIImage], foodID: String, desc: String, rating: String, price: String, FDA: String, porsi: String) async throws -> Data {
        guard let url = URL(string: RemoteURL.review) else {
            throw RemoteServiceError.badURL
        }

        let mpfd = MultiPartFormDataRequest(url: url, method: .post)
        var i = 0
        images.forEach { image in
            mpfd.addDataField(named: "images[]",
                              data: image.jpegData(compressionQuality: 0.5) ?? Data(),
                              fileName: "food-image-\(i).jpeg",
                              mimeType: "image/jpeg")
            i += 1
        }
        mpfd.addASCIIField(named: "food_id", value: foodID)
        mpfd.addASCIIField(named: "desc", value: desc)
        mpfd.addASCIIField(named: "rating", value: rating)
        mpfd.addASCIIField(named: "price", value: price)
        mpfd.addASCIIField(named: "FDA", value: FDA)
        mpfd.addASCIIField(named: "porsi", value: porsi)

        var request = mpfd.asURLRequest()

        let token = authState?.token ?? ""
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)
        print("data \(JSON(data))")
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RemoteServiceError.badServerResponse
        }
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            print("error \(httpResponse)")
            throw RemoteServiceError.badResponseID(status: httpResponse.statusCode)
        }
        return data
    }

    func fetchData() {
        Task { @MainActor in
            do {
                let restaurantReviewsResponse = try await RemoteDataService().getData(APIReturn<[RestaurantReviews]>.self, url: RemoteURL.restaurant, token: authState?.token)
                let result = restaurantReviewsResponse.data
                restaurantReviews = result

                var tempRestaurantList: [String] = []
                for restaurant in restaurantReviews {
                    tempRestaurantList.append(restaurant.name)
                }
                restaurantList = tempRestaurantList
            } catch {
                print(error)
            }
        }
    }

//    func filterFoodByRestaurantName(_ name: String) -> RestaurantReviews{
//        do{
//            let filteredRestaurantReviews = try restaurantReviews.filter{$0.name == name}
//            filteredResult = filteredRestaurantReviews.first!
//        } catch {
//            print(error)
//        }
//
//    }

    func getFoodsByRestaurant(_ name: String) -> [FoodFromRestaurant] {
        let filteredRestaurantReviews = restaurantReviews.filter { $0.name == name }.first
        guard let filteredRestaurantReviews = filteredRestaurantReviews else { return [] }

        return filteredRestaurantReviews.foods
    }

    func getFoodsByRestaurantName(_ name: String) -> [String] {
        var foodList: [String] = []
        let filteredRestaurantReviews = restaurantReviews.filter { $0.name == name }.first
        if let filteredRestaurantReviews = filteredRestaurantReviews {
            for food in filteredRestaurantReviews.foods {
                foodList.append(food.name)
            }
        }
        return foodList
    }

    func getAddressByRestaurantName(_ name: String) -> String {
        var address = ""
        let filteredRestaurantReviews = restaurantReviews.filter { $0.name == name }.first
        if let filteredRestaurantReviews = filteredRestaurantReviews {
            address = filteredRestaurantReviews.location
        }
        return address
    }
}
