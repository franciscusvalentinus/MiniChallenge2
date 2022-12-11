//
//  CreateView.swift
//  mini-challenge-2
//
//  Created by William on 11/07/22.
//

import SwiftUI

struct CreateReview: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authState: AuthState
    @State var menuName: String = ""
    @State var restaurantName: String = ""
    @State var districtName: String = ""
    @State var porsi: String = ""
    @State var alamat: String = ""
    @State var dateSelected: Date = .init()
    @State var price: String = ""
    @State var FDAindexSelected: Int = 0
    @State var deskripsi: String = ""
    @State var ratingIndexSelected: Int = 0
    @State var showImagePicker: Bool = false
    @State var imagesUploaded: [UIImage] = []
    
    @State var foodList: [String] = []
    @State var foods: [FoodFromRestaurant] = []
    
    var formValidate: Bool {
        menuName == "" || restaurantName == "" || porsi == "" || price == "" || deskripsi == "" || ratingIndexSelected == 0 || imagesUploaded.count == 0
    }

    @StateObject var vm = CreateReviewViewModel()
    
    let FDAPlatforms: [String] = ["GoFood", "GrabFood", "ShopeeFood", "TravelokaFood"]
    let dummyContent: [String] = ["A", "B", "C"]
    var districtList: [String] = District.surabaya
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Group {
                        // Uploaded Images
                        VStack {
                            HStack {
                                Text("Upload Foto")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: true, content: {
                                HStack(spacing: 20) {
                                    ForEach(imagesUploaded.indices, id: \.self) { index in
                                        ZStack {
                                            SmallReviewImage(image: imagesUploaded[index])
                                            VStack {
                                                HStack {
                                                    Spacer()
                                                    Button {
                                                        imagesUploaded.remove(at: index)
                                                    } label: {
                                                        Image(systemName: "multiply.circle.fill")
                                                            .resizable()
                                                            .foregroundColor(.red)
                                                            .frame(width: 25, height: 25)
                                                            .background(.white)
                                                            .cornerRadius(25)
                                                    }
                                                    .padding([.top, .trailing], -10)
                                                }
                                                Spacer()
                                            }
                                        }
                                    }
                                    Button {
                                        self.showImagePicker.toggle()
                                    } label: {
                                        Rectangle()
                                            .frame(width: 200, height: 150)
                                            .cornerRadius(10)
                                            .foregroundColor(Color(UIColor.systemGray5))
                                            .overlay {
                                                Image(systemName: "plus")
                                            }
                                        Spacer()
                                    }
                                    .sheet(isPresented: $showImagePicker) {
                                        ImagePickerView(sourceType: .photoLibrary) { images in
                                            imagesUploaded.append(images)
                                        }
                                    }
                                }
                                .padding([.bottom, .top])
                            })
                        }
                        // Nama Restoran : Combobox
                        //                    CustomComboBox(title: "Nama Menu*", itemSelections: dummyContent, selectedItem: $menuName)
                        CustomSelectionField(fieldTitle: "Nama Restoran*", selectionTitle: "Pilih Restoran", data: vm.restaurantList, dataSelected: $restaurantName)
                            .onChange(of: restaurantName) { _ in
                                foodList = vm.getFoodsByRestaurantName(restaurantName)
                                foods = vm.getFoodsByRestaurant(restaurantName)
                                alamat = vm.getAddressByRestaurantName(restaurantName)
                                menuName = foodList[0]
                            }
                        
                        // Nama Menu : Combobox
//                        CustomComboBox(title: "Nama Restoran*", itemSelections: dummyContent, selectedItem: $restaurantName)
                        CustomSelectionField(fieldTitle: "Nama Makanan*", selectionTitle: "Pilih Makanan", data: foodList, dataSelected: $menuName)
                            
                        // Alamat : TextField
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Alamat*")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                    Text("Alamat lengkap restoran")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(.gray)
                                }
                            
                                Spacer()
                            }
                            TextField(alamat, text: $alamat)
                                .padding(10)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10)
                                .disabled(true)
                        }
                        .padding(.bottom, 15)
                    
                        // Porsi : Combobox
                        VStack {
                            HStack {
                                Text("Porsi*")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                            }
                            Picker("Porsi", selection: $porsi) {
                                Text("Pelit 😠").tag("pelit")
                                Text("B Aja 🤐").tag("baja")
                                Text("Pas 🙂").tag("pas")
                                Text("Kuli 😀").tag("kuli")
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.bottom, 15)
                    
                        // Harga : TextField (Number Format with Number Handling)
                        VStack {
                            HStack {
                                Text("Harga (Sudah termasuk diskon dan lain - lain)*")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                            }
                            TextField(price, text: $price)
                                .padding(10)
                                .keyboardType(.numberPad)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                    }
                    Group {
                        // Available at : RadioButton
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Platform*")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                    Text("Beli di platform apa?")
                                        .font(.system(size: 10, weight: .regular, design: .default))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        
                            VStack(spacing: 5) {
                                ForEach(FDAPlatforms.indices, id: \.self) { fdaIndex in
                                    HStack {
                                        Text(FDAPlatforms[fdaIndex])
                                            .font(.system(size: 14, weight: .semibold, design: .default))
                                        Spacer()
                                        Button {
                                            FDAindexSelected = fdaIndex
                                        } label: {
                                            Image(systemName: (fdaIndex == FDAindexSelected) ? "circle.circle.fill" : "circle")
                                                .foregroundColor(fdaIndex == FDAindexSelected ? .blue : .primary)
                                        }
                                    }
                                }
                            }
                            .padding([.trailing, .leading, .bottom])
                            .padding(.top, 1)
                        }
                        .padding(.bottom, 15)
                    
                        // Deskripsi : TextField (or TextArea)
                        VStack {
                            HStack {
                                Text("Deskripsi*")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                            }
                            TextField(deskripsi, text: $deskripsi)
                                .padding(10)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 15)
                    
                        // Rating : Stars (Aligned horizontally)
                        VStack {
                            HStack {
                                Text("Rating*")
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                            }
                            .padding(.bottom)
                            HStack(alignment: .top) {
                                ForEach(1 ..< 6) { rating in
                                    Button {
                                        ratingIndexSelected = rating
                                    } label: {
                                        VStack(spacing: 10) {
                                            Text(ReviewHandler().getReviewEmoji(review: rating))
                                                .font(.system(size: 32))
                                            Text(ReviewHandler().getReviewConvertedStringOnly(review: rating))
                                                .foregroundColor((rating == ratingIndexSelected) ? Color.white : Color.black)
                                                .font(.system(size: 10))
                                        }
                                        .padding([.vertical])
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        
                                        .background((rating == ratingIndexSelected) ? Color.blue : Color(UIColor.systemGray5))
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 50)
                        // Done : Button
                        CustomButton(buttonLabel: "Selesai", disabled: formValidate) {
                            guard let id = foods.first(where: { $0.name == menuName })?.id else { return }
                            
                            Task { @MainActor in
                                do {
                                    _ = try await vm.create(images: imagesUploaded,
                                                                            foodID: String(id),
                                                                            desc: deskripsi,
                                                                            rating: String(ratingIndexSelected),
                                                                            price: price,
                                                                            FDA: FDA.keys[FDAindexSelected],
                                                                            porsi: porsi)
                                    dismiss()
                                } catch {
                                    print("errorfull \(error)")
                                    print("Error \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                } // VStack
                
                .padding()
            } // ScrollView
            .onAppear {
                vm.setup(authState)
                vm.fetchData()
            }
            .navigationBarHidden(true)
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReview()
            .environmentObject(AuthState())
    }
}
