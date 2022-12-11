//
//  CustomButton.swift
//  mini-challenge-2
//
//  Created by William on 19/07/22.
//

import SwiftUI

struct CustomButton: View {
    var buttonLabel: String
    var buttonAction: () -> Void
    var disabled: Bool = false
    var body: some View {
        HStack {
            Button {
                buttonAction()
            } label: {
                Text(buttonLabel)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .background(disabled ? Color(UIColor.systemGray5) : .blue)
            .cornerRadius(10)
            .disabled(disabled)
        }
    }
}
