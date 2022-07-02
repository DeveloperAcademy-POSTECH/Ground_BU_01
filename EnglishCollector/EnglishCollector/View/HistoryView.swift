//
//  HistoryView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/07/02.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var englishData : EnglishData
    @State private var isShowModal: Bool = false
    @State private var editedword: String = ""
    var body: some View {
        List {
            ForEach(englishData.words, id: \.self) { word in
                HStack {
                    Text(word)
                    Spacer()
                    Button(action: {
                        self.isShowModal.toggle()
                        self.editedword = word
                        if editedword != word {
                            //
                        }
                    }, label: {
                        Image(systemName: "pencil.circle")
                    })
                    .sheet(isPresented: $isShowModal, content: {
                        EditView(isShowModal: $isShowModal, editedword: $editedword)
                    })
                }
            }
        }
    }
    
    func editProperties (word: String) -> Void {
        self.isShowModal.toggle()
        if self.editedword != word {
            //
        } else {
            //
        }
    }
}
    
    struct HistoryView_Previews: PreviewProvider {
        static var previews: some View {
            HistoryView()
        }
    }
