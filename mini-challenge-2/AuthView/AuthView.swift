//
//  AuthView.swift
//  mini-challenge-2
//
//  Created by William on 23/07/22.
//

import SwiftUI

struct AuthView: View {
    @State var toLogin: Bool = true
    var body: some View {
        if(toLogin){
            LoginView(toLogin: $toLogin)
                .transition(AnyTransition.opacity.animation(.default))
        }else{
            RegisterView(toLogin: $toLogin)
                .transition(AnyTransition.opacity.animation(.default))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(AuthState())
    }
}
