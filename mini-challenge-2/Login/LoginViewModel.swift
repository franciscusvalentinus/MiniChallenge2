//
//  LoginViewModel.swift
//  mini-challenge-2
//
//  Created by Clarence on 24/06/22.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    var authState: AuthState?

    @Published var hasError = false
    @Published var errorMessage: String = ""

    func setup(_ authState: AuthState) {
        self.authState = authState
    }

    func login(_ email: String, _ password: String) {
        Task { @MainActor in
            do {
                let loginResponse = try await RemoteDataService().postData(APIReturn<Login>.self, url: RemoteURL.login, body: ["email": email, "password": password])
                authState?.isAuthenticated = true
                authState?.user = loginResponse.data.user
                authState?.token = loginResponse.data.api_token
                APIToken.saveToken(APIToken(token: loginResponse.data.api_token))
                hasError = false
            } catch {
                print("Error \(error.localizedDescription)")
                let statusCode = error.localizedDescription

                if statusCode == "401" {
                    hasError = true
                    errorMessage = "Username atau password salah"
                }
            }
        }
    }

    func test_token() {
        // get token from plist
//        let api = api_token(token: "wkctKgTqds2KXBYOdqpLIKTY")
//        api_token.saveToken(api)
        guard let api_token = APIToken.loadToken() else { return }

        // test get data (authenticate test)

        Task { @MainActor in
            do {
                let testResponse = try await RemoteDataService().getData(APIReturn<Login>.self, url: RemoteURL.test, token: api_token.token)
                print(testResponse)
                // save data ke authState
                authState?.isAuthenticated = true
                authState?.user = testResponse.data.user
                authState?.token = testResponse.data.api_token

            } catch {
                print("Error \(error.localizedDescription)")
                print(String(describing: error))
            }
        }
        // if true => save data ke authState
    }
}

struct Login: Codable {
    let api_token: String
    let user: User
}
