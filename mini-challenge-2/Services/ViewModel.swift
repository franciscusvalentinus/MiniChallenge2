//
//  ViewModel.swift
//  mini-challenge-2
//
//  Created by Daffa Yagrariksa on 28/06/22.
//

import Foundation

class ViewModel: ObservableObject {
    var authState: AuthState?

    func setup(_ authState: AuthState) {
        self.authState = authState
    }
}
