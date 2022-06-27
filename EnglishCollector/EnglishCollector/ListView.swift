//
//  ListView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var englishData = EnglishData()
    @Binding var englishWordCount: Int
    @Binding var isGoToListView: Bool

    var body: some View {
        VStack {
            Text("Your chosen word count: \(englishWordCount)")

            Button(action: {
                Task {
                    do {
                        let url = URL(string: "https://random-word-api.herokuapp.com/word?number\(englishWordCount)")
                        let (data, response) = try await URLSession.shared.data(from: url!)
                        guard let httpResponse = response as? HTTPURLResponse, successRange.contains(httpResponse.statusCode) else {
                            // 오류처리
                            
                            isGoToListView.toggle()
                            return
                        }
                        englishData.words = try JSONDecoder().decode([String].self, from: data)
                    } catch {
                        isGoToListView.toggle()
                        fatalError("Data couldn't be loaded : \(error)")                    }
                }
            }, label: {
                Text("Load")
            })
            List {
                ForEach(englishData.words, id: \.self) { word in
                    Text(word)
                }
            }
            .frame(maxWidth:300)
            .task {
                await englishData.reload()
            }
            Picker("", selection: $englishWordCount, content: {
                ForEach(1...15, id: \.self) {
                    Text("\($0)")
                }
            })
            .frame(maxWidth: 200)
            .pickerStyle(.wheel)
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(englishWordCount: .constant(5), isGoToListView: .constant(true))
    }
}