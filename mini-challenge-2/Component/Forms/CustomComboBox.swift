//
//  CustomComboBox.swift
//  mini-challenge-2
//
//  Created by William on 19/07/22.
//

import SwiftUI

struct CustomComboBox: View {
    var title: String
    var itemSelections: [String]
    @Binding var selectedItem: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .bold, design: .default))
            Spacer()
        }

        Menu {
            ForEach(itemSelections, id: \.self) { items in
                Button {
                    selectedItem = items
                } label: {
                    Text(items)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }

        } label: {
            Rectangle()
                .foregroundColor(Color(UIColor.systemGray5))
                .overlay {
                    HStack {
                        Text(selectedItem)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .cornerRadius(10)
        }
        .frame(width: .infinity, height: 40)
        .padding(.bottom, 15)
    }
}
