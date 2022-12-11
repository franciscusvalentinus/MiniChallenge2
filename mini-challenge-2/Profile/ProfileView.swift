//
//  ProfileView.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 24/06/22.
//

import NukeUI
import SwiftUI

struct ProfileView: View {
    @State private var isUnauth = false
    @State private var toEdit: Bool = false
    @StateObject private var vm = ProfileViewModel()
    @EnvironmentObject var authState: AuthState

    var body: some View {
        NavigationView {
            RefreshableScrollView {
                VStack {
                    VStack {
//                        AsyncImage(url: URL(string: authState.user?.image ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")) { image in
//                            image.resizable()
//                        } placeholder: {
//                            Text("")
//                        }
                        LazyImage(source: URL(string: authState.user?.image ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"))
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text(authState.user?.name ?? "No One")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding([.bottom], 30)
                    NavigationLink(destination: AuthView(), isActive: $isUnauth, label: { EmptyView() })
                    NavigationLink(destination: EditProfileView(), isActive: $toEdit, label: { EmptyView() })
                    if let userReviews = vm.userReview {
                        PostinganTab(userReviews: userReviews)
                    }
                    if vm.userReview?.count == 0 {
                        Text("Tidak ada review")
                    }
                }
            }
            .onAppear {
                vm.setup(authState)
                vm.fetchUserReview()
            }
            .refreshable {
                vm.fetchUserReview()
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
//                        Button {
//                            // Navigate to Edit Profile
//                            toEdit = true
                        ////                            toEdit = false
//                            print("lewat")
//                        } label: {
//                            HStack {
//                                Text("Ubah Profil")
//                                Spacer()
//                                Image(systemName: "square.and.pencil")
//                            }
//                        }
                        Button {
                            authState.isAuthenticated = false
                            authState.token = nil
                            authState.user = nil
                            isUnauth = true
                            APIToken.saveToken(APIToken(token: ""))
                        } label: {
                            HStack {
                                Text("Keluar")
                                Spacer()
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }

        .tabItem {
            Label("Profile", systemImage: "person.crop.circle.fill")
            Text("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthState())
    }
}

struct PostinganTab: View {
    var userReviews: [Review]
    var body: some View {
        ForEach(userReviews) { reviews in
            Divider()
            VStack {
                PostHeader(profileImageString: reviews.user.image, userDisplayName: reviews.user.name, userRole: reviews.user.role, reviewDate: Date.getStringFromDate(date: reviews.created_date, .date))

                NavigationLink(destination: DetailReviewView(id: reviews.id)) {
                    VStack {
                        PostBody(reviewImageString: reviews.images[0], foodName: reviews.food.name, rating: reviews.rating, restaurantName: reviews.food.restaurant.name, reviewDescription: reviews.desc, price: reviews.price, platform: reviews.FDA)
                    }
                }
                PostTraction(ratingCount: reviews.rating)
            }
            .padding()
        }
    }
}
