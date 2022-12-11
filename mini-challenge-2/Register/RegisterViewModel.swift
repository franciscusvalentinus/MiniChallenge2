//
//  RegisterViewModel.swift
//  mini-challenge-2
//
//  Created by Daffa Yagrariksa on 27/06/22.
//

import SwiftUI

final class RegisterViewModel: ViewModel {
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    func register(_ email: String, _ password: String, _ name: String) {
        Task { @MainActor in
            do {
                let registerResponse = try await
                    RemoteDataService().postData(
                        APIReturn<Login>.self,
                        url: RemoteURL.register,
                        body: [
                            "email": email,
                            "password": password,
                            "name": name,
                        ],
                        useToken: false
                    )
                authState?.isAuthenticated = true
                authState?.user = registerResponse.data.user
                authState?.token = registerResponse.data.api_token
                APIToken.saveToken(APIToken(token: registerResponse.data.api_token))
            } catch {
                print("Erro \(error.localizedDescription)")
            }
        }
    }
}
