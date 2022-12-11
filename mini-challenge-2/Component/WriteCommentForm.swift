//
//  WriteCommentForm.swift
//  SwiftUI-mc2-lab
//
//  Created by William on 23/06/22.
//

import SwiftUI

struct WriteCommentForm: View {
    @Binding var textFieldString: String
    var body: some View {
        HStack {
            Spacer()
            TextField("Write a Comment", text: $textFieldString)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray, lineWidth: 1)
                )
                .foregroundColor(.primary)

            Spacer()
            Button {
                print("Printed")
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
            }
            .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color("adjustedColor"))
    }
}
