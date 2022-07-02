//
//  EditView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/07/02.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var englishData : EnglishData
    @Binding var isShowModal: Bool
    @Binding var editedword: String
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    isShowModal.toggle()
                }, label: {
                    Image(systemName: "x.circle")
                        .resizable()
                })
                .frame(width: 30, height: 30)
                .padding()
            }
            HStack {
                TextField("Edit", text: $editedword)
                .frame(maxWidth:200, maxHeight:40 , alignment: .center)
                .padding(.leading, 50)
                Button(action: {
                    print(editedword)
                }, label: {
                    Image(systemName: "checkmark.circle")
                })
            }
            Spacer()
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(isShowModal: .constant(true), editedword: .constant(""))
    }
}
