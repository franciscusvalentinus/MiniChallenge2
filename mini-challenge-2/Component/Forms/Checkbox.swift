//
//  Checkbox.swift
//  mini-challenge-2
//
//  Created by Clarence on 11/07/22.
//

import SwiftUI

struct Checkbox: View {
    var checkboxText: String
    @Binding var checked: Bool

    init(_ checkboxText: String, checked: Binding<Bool>) {
        self.checkboxText = checkboxText
        self._checked = checked
    }

    var body: some View {
        HStack {
            Text("\(checkboxText)")

            Spacer()

            Image(systemName: checked ? "square.inset.filled" : "square")
                .foregroundColor(checked ? CustomColor.lightBlue : Color.secondary)
        }.onTapGesture {
            self.checked.toggle()
        }
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox("Helloffo", checked: .constant(true))
    }
}
