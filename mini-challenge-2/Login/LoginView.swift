//
//  LoginView.swift
//  SwiftBootcamp
//
//  Created by Putu Denisa Florence Satriani on 24/06/22.
//

import SwiftUI

struct LoginView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @StateObject var vm = LoginViewModel()
    @EnvironmentObject var authState: AuthState
    @State var error: Bool = false
    @Binding var toLogin: Bool
    var body: some View {
        VStack {
            Text("Selamat Datang di Cakuy")
                .font(.system(size: 30, weight: .semibold, design: .default))
                .padding(.bottom, 50)
            Group {
                CustomTextField(title: "Alamat Email", description: "", placeholder: "Masukkan alamat email", textFieldBinding: $userEmail, keyboardType: .emailAddress)

                CustomPasswordField(title: "Kata Sandi", description: "", placeholder: "Masukkan kata sandi", secureFieldBinding: $userPassword)
            }

            if vm.hasError {
                VStack(alignment: .leading) {
                    HStack {
                        Text(vm.errorMessage)
                        Spacer()
                    }
                }
                .font(.system(size: 12, weight: .semibold, design: .default))
                .foregroundColor(.red)
                .frame(maxWidth: .infinity)
            }

            CustomButton(buttonLabel: "Masuk") {
                vm.login(userEmail, userPassword)
                userEmail = ""
                userPassword = ""
            }
            .padding([.bottom, .top], 15)

            HStack(spacing: 0) {
                Text("Baru di Cakuy? ")
                    .font(Font.custom("Avenir Next", size: 15))
                    .fontWeight(.bold)

                // Navigate to register
//                NavigationLink(destination: RegisterView(), isActive: $toRegister) {
//                    EmptyView()
//                }
                
                Button{
                    toLogin = false
                }label:{
                    Text("Daftar disini")
                        .font(Font.custom("Avenir Next", size: 15))
                        .fontWeight(.bold)
                        .underline(true, color: .black)
                        .foregroundColor(.blue)
                }
                
            }
        }
        .onAppear {
            vm.setup(authState)
            vm.test_token()
        }
        .padding()
        .fullScreenCover(isPresented: $authState.isAuthenticated, content: MainView.init)
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//            .environmentObject(AuthState())
//    }
//}
