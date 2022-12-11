//
//  AuthState.swift
//  mini-challenge-2
//
//  Created by Clarence on 24/06/22.
//

import Foundation

class AuthState: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var token: String?
}
