//
//  HistoryView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/07/02.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var englishData : EnglishData
    
    // MARK: State
    @State private var isShowModal: Bool = false
    @State private var editedword: String = ""
    @State private var isEditFixed: Bool = false
    @State private var indexOfOrigin: Int = 0
    
    func displaceWord (from oldWord: String) -> () {
        self.editedword = oldWord
    }
    
    var body: some View {
        List {
            ForEach(Array(englishData.words.enumerated()), id: \.element) { index, word in
                HStack {
                    Text(word)
                    Spacer()
                    Button(action: {
                        self.isShowModal.toggle()
                        self.displaceWord(from: word)
                        self.indexOfOrigin = index
                    }, label: {
                        Image(systemName: "pencil.circle")
                    })
                    .sheet(isPresented: $isShowModal, content: {
                        EditView(isShowModal: $isShowModal, editedword: $editedword, isEditFixed: $isEditFixed, indexOfOrigin: $indexOfOrigin)
                    })
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
