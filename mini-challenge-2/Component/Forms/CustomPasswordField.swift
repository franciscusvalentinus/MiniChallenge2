//
//  CustomPasswordField.swift
//  mini-challenge-2
//
//  Created by William on 19/07/22.
//

import SwiftUI

struct CustomPasswordField: View {
    var title: String
    var description: String
    var placeholder: String
    @Binding var secureFieldBinding: String
    var keyboardType: UIKeyboardType = .default
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 14, weight: .bold, design: .default))
                    if description != "" {
                        Text(description)
                            .font(.system(size: 10, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                    }
                }

                Spacer()
            }
            SecureField(placeholder, text: $secureFieldBinding)
                .padding(10)
                .keyboardType(keyboardType)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
        }
        .padding(.bottom, 15)
    }
}
