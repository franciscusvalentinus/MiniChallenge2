//
//  ReviewView.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//

import SwiftUI

struct ReviewView: View {
    @StateObject private var vm = ReviewViewModel()
    @EnvironmentObject var authState: AuthState

    @State private var showAddNew = false
    @State private var showFilter = false
    @State private var districtSelected: String = District.surabaya[0]
    @StateObject var filterModel = FilterModel()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                RefreshableScrollView {
                    HStack {
                        Spacer()
                        Button(action: {
                            showFilter.toggle()
                        }) {
                            Label("Filter", systemImage: "slider.horizontal.3")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.primary)
                        }
                        .padding(8)
                        .background(CustomColor.gray200)
                        .cornerRadius(10)
                        .sheet(isPresented: $showFilter) {
                            FilterView(filter: filterModel)
                        }
                    }

                    if vm.isLoading {
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }.frame(minHeight: geometry.size.height)
                    }

                    if vm.hasError {
                        VStack {
                            Image("error-404")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Terjadi Kesalahan").font(.title).bold()
                            CustomButton(buttonLabel: "Refresh") {
                                vm.fetchReviews()
                            }
                        }.padding(.horizontal, 10)
                    }

                    // Loop for x amount of posts available

                    ForEach(vm.reviews, id: \.id) { reviews in
                        // Lazy V Stack for loading only when needed (Memory Management purposes)1
                        VStack {
                            // Post Header
                            PostHeader(profileImageString: reviews.user.image, userDisplayName: reviews.user.name, userRole: reviews.user.role, reviewDate: Date.getStringFromDate(date: reviews.created_date, .date))
                            NavigationLink(destination: DetailReviewView(id: reviews.id)) {
                                VStack {
                                    // Post Body
                                    PostBody(reviewImageString: reviews.images[0], foodName: reviews.food.name, rating: reviews.rating, restaurantName: reviews.food.restaurant.name, reviewDescription: reviews.desc, price: reviews.price, platform: reviews.FDA)
                                }
                            }

                            // Post Traction
                            PostTraction(ratingCount: reviews.rating)
                            Divider()
                        }
                        .padding(.top, 10)
                    }
                } // RefreshableScrollView
            } // GeometryReader

            .navigationTitle("Beranda")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                vm.setup(authState, filterModel)
                vm.fetchReviews()
            }
            .padding(.trailing)
            .padding(.leading)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Button daftar kecamatan, no content at the moment.
//                    Button {
//
//                    } label: {
//                        HStack {
//                            Image(systemName: "mappin")
//                            Text("Keputih")
//                        }
//                    }
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(Color.accentColor)
                        Picker(districtSelected, selection: $districtSelected) {
                            ForEach(District.surabaya, id: \.self) { district in
                                Text(district)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Tambah") {
                        showAddNew.toggle()
                    }
                    .sheet(isPresented: $showAddNew) {
                        CreateReview()
                    }
                }
            }
        }
        .refreshable {
            vm.fetchReviews()
        }
        .onChange(of: showFilter, perform: { value in
            if vm._oldURL != vm.getReviewURLWithFilter() {
                vm.fetchReviews()
            }

        })
        .onChange(of: showAddNew, perform: { value in
            if showAddNew == false {
                vm.fetchReviews()
            }

        })
        .tabItem {
            Label("Beranda", systemImage: "house.fill")
            Text("Beranda")
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReviewView()
                .environmentObject(AuthState())
        }
    }
}
