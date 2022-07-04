//
//  EditView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/07/02.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var englishData : EnglishData
    
    // MARK: Binding
    @Binding var isShowModal: Bool
    @Binding var editedword: String
    @Binding var isEditFixed: Bool
    @Binding var indexOfOrigin: Int
    
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
                    isEditFixed.toggle()
                    isShowModal.toggle()
                }, label: {
                    Image(systemName: "checkmark.circle")
                })
            }
            Spacer()
        }
        .onDisappear(perform: {
            if isEditFixed == true {
                englishData.words[indexOfOrigin] = editedword
                isEditFixed.toggle()
            } else {
                // do nothing
            }
        })
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(isShowModal: .constant(true), editedword: .constant(""), isEditFixed: .constant(true), indexOfOrigin: .constant(1)
        )
    }
}
