//
//  FilterView.swift
//  mini-challenge-2
//
//  Created by Clarence on 11/07/22.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var filter: FilterModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text("Filter").font(.title2).bold()

                Spacer()

                Button("Hapus filter") {
                    filter.clearFilters()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.secondary)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.secondary, lineWidth: 3)
                )
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Platform").font(.headline)

                Checkbox("GoFood", checked: $filter.platform_gofood)
                Divider()
                Checkbox("GrabFood", checked: $filter.platform_grabfood)
                Divider()
                Checkbox("ShopeeFood", checked: $filter.platform_shopeefood)
                Divider()
                Checkbox("TravelokaEats", checked: $filter.platform_travelokaeats)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Rentang Harga").font(.headline)

                Checkbox("Di bawah Rp16.000", checked: $filter.priceRange1)
                Divider()
                Checkbox("Rp16.000 sampai Rp40.000", checked: $filter.priceRange2)
                Divider()
                Checkbox("Rp40.000 sampai Rp100.000", checked: $filter.priceRange3)
                Divider()
                Checkbox("Di atas Rp100.000", checked: $filter.priceRange4)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Rating").font(.headline)
                HStack(spacing: 10) {
                    Button(action: {
                        if filter.rating == .SELECTED_4 {
                            filter.rating = .NO_RATING
                        } else {
                            filter.rating = .SELECTED_4
                        }
                    }) {
                        Label("Bintang 4+", systemImage: "star.fill")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
                    .background(filter.rating == .SELECTED_4 ? CustomColor.lightBlue : CustomColor.gray100)
                    .cornerRadius(20)

                    Button(action: {
                        if filter.rating == .SELECTED_5 {
                            filter.rating = .NO_RATING
                        } else {
                            filter.rating = .SELECTED_5
                        }
                    }) {
                        Label("Bintang 5", systemImage: "star.fill")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
                    .background(filter.rating == .SELECTED_5 ? CustomColor.lightBlue : CustomColor.gray100)
                    .cornerRadius(20)
                }
            }

            Button(action: {
                dismiss()
            }) {
                Text("Done")
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 40)
            }
            .background(CustomColor.lightBlue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 20)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filter: FilterModel())
    }
}
