//
//  CustomButtonSheet.swift
//  mini-challenge-2
//
//  Created by William on 19/07/22.
//

import SwiftUI

struct CustomSelectionField: View {
    var fieldTitle: String
    var selectionTitle: String
    @State var multiselectionFieldView: Bool = false
    var data: [String]
    @Binding var dataSelected: String
    var body: some View {
        VStack {
            HStack {
                Text(fieldTitle)
                    .font(.system(size: 14, weight: .bold, design: .default))
                Spacer()
            }
//            NavigationLink("yes", isActive: $multiselectionFieldView, destination: MultiselectionFieldView(dataSelected: $dataSelected, data: $data))
            NavigationLink(destination: CustomSelectionFieldView(title: selectionTitle, data: data, dataSelected: $dataSelected), isActive: $multiselectionFieldView, label: { EmptyView() })
            Button {
                multiselectionFieldView = true
            } label: {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemGray5))
                    .overlay {
                        HStack {
                            Text(dataSelected)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "arrowtriangle.right.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                    .cornerRadius(10)
            }
            .frame(width: .infinity, height: 40)
        }
        .padding(.bottom, 15)
    }
}

struct CustomSelectionFieldView: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var data: [String]
    @Binding var dataSelected: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(data, id: \.self) { items in
                    Button {
                        dataSelected = items
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Text(items)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Divider()
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(title)
    }
}
