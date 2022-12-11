//
//  EditProfile.swift
//  mini-challenge-2
//
//  Created by William on 13/07/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userImage: UIImage?
    @State var showImagePicker: Bool = false
    var body: some View {
        VStack {
            VStack {
                Text("Edit Profile")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                Button {
                    // Edit profile image
                } label: {
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")) { image in
                        image.resizable()
                    } placeholder: {
                        Text("")
                    }
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.bottom, 10)
                .padding(.top, 30)

                Button {
                    self.showImagePicker = true
                } label: {
                    Text("Ubah Foto Profil")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: .photoLibrary) { images in
                        userImage = images
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding([.bottom], 30)

            CustomTextField(title: "Nama", description: "", placeholder: userName, textFieldBinding: $userName)
                .overlay {
                    if userName != "" {
                        Button {
                            userName = ""
                        } label: {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "multiply.circle.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                            }
                        }
                        .padding([.top, .trailing], 10)
                    }
                }
            CustomTextField(title: "Alamat email", description: "", placeholder: userEmail, textFieldBinding: $userEmail)
                .overlay {
                    if userEmail != "" {
                        Button {
                            userEmail = ""
                        } label: {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "multiply.circle.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                            }
                        }
                        .padding([.top, .trailing], 10)
                    }
                }
            Spacer()
            CustomButton(buttonLabel: "Simpan") {
                // Save edited profile
            }
            .padding(.top)
            Spacer()
        }
        .padding()
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
