//
//  ContentView.swift
//  RegisterView
//
//  Created by Franciscus Valentinus Ongkosianbhadra on 27/06/22.
//

import SwiftUI

struct RegisterView: View {
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var userPasswordConfirmation: String = ""
    @StateObject var vm = RegisterViewModel()
    @EnvironmentObject var authState: AuthState
    @State var error: Bool = false
    @Binding var toLogin: Bool
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Selamat Datang di Cakuy")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .padding(.bottom, 5)
                Text("Sepertinya Anda belum mempunyai akun, buatlah akun baru dengan mengisi informasi kamu di bawah ini")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)
            }
            Group {
                CustomTextField(title: "Nama", description: "", placeholder: "Masukkan nama", textFieldBinding: $userName, keyboardType: .default)

                CustomTextField(title: "Alamat Email", description: "", placeholder: "Masukkan alamat email", textFieldBinding: $userEmail, keyboardType: .emailAddress)

                CustomPasswordField(title: "Kata Sandi", description: "", placeholder: "Masukkan kata sandi", secureFieldBinding: $userPassword)

                CustomPasswordField(title: "Konfirmasi Kata Sandi", description: "", placeholder: "Masukkan konfirmasi kata sandi", secureFieldBinding: $userPasswordConfirmation)
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
                if userPassword != userPasswordConfirmation {
                    vm.hasError = true
                    vm.errorMessage = "Kata sandi tidak sama dengan konfirmasi kata sandi"
                    return
                }
                vm.register(userEmail, userPassword, userName)
                userEmail = ""
                userPassword = ""
                userName = ""
                userPasswordConfirmation = ""
            }
            .padding([.bottom, .top], 15)

            HStack(spacing: 0) {
                Text("Sudah punya akun? ")
                    .font(Font.custom("Avenir Next", size: 15))
                    .fontWeight(.bold)

                // Navigate to login
                Button{
                    toLogin = true
                }label:{
                    Text("Masuk disini")
                        .font(Font.custom("Avenir Next", size: 15))
                        .fontWeight(.bold)
                        .underline(true, color: .black)
                        .foregroundColor(.blue)
                }
                
            }
        }
        .onAppear {
            vm.setup(authState)
//            vm.test_token()
        }
        .padding()
        .fullScreenCover(isPresented: $authState.isAuthenticated, content: MainView.init)
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(, toLogin: <#Binding<Bool>#>)
//            .environmentObject(AuthState())
//    }
//}
