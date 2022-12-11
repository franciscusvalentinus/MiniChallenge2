//
//  LoginView.swift
//  mini-challenge-2
//
//  Created by Clarence on 24/06/22.
//

import SwiftUI

struct LoginViewOld: View {
    @StateObject var vm = LoginViewModel()
    @EnvironmentObject var authState: AuthState

    var body: some View {
        VStack(spacing: 4) {
            Text("authenticated: \(authState.isAuthenticated ? "True" : "False")")
            if let user = authState.user {
                Text("User: \(user.name)")
            }

            if vm.hasError {
                Text("Error: \(vm.errorMessage ?? "Error")")
            }

            Button {
                vm.login("email", "passwordSalah")
            } label: {
                Text("Login Fail")
            }

            Button {
                vm.login("JessicaVicky@gmail.com", "password")
            } label: {
                Text("Login Success")
            }

            NavigationLink(destination: EmptyView(), label: {
                Text("go to Register page")
            })

//                NavigationLink(destination: MainView(), isActive: $authState.isAuthenticated, label: { EmptyView() })

        }.onAppear {
            vm.setup(authState)
            vm.test_token()
        }
        .fullScreenCover(isPresented: $authState.isAuthenticated, content: MainView.init)
//        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

//struct LoginViewOld_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//            .environmentObject(AuthState())
//    }
//}
