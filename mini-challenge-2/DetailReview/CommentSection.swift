//
//  CommentSection.swift
//  mini-challenge-2
//
//  Created by Clarence on 13/07/22.
//

import SwiftUI

struct CommentSection: View {
    var buttonAction: (_ comment: String) -> Void

    @State var comment: String = ""

    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Tulis komentar...", text: $comment)
                .padding(10)
                .padding(.horizontal, 7)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(30)

            Button(action: { buttonAction(comment) }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(comment == "" ? Color.gray : Color.accentColor)
            }.padding(.trailing, 7)
        }
    }
}

struct CommentSection_Previews: PreviewProvider {
    static var previews: some View {
        CommentSection(buttonAction: { print("Comment \($0)") })
    }
}
