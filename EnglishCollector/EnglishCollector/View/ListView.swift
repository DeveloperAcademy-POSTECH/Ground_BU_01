//
//  ListView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var englishData : EnglishData
    
    var body: some View {
        VStack {
            Text("Your chosen word count: \(englishData.wordCount)")
            
            Button(action: {
                Task {
                    //                    await englishData.reload(isGoToBack: $isGoToListView)
                    do {
                        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(englishData.wordCount)")
                        let (data, response) = try await URLSession.shared.data(from: url!)
                        guard let httpResponse = response as? HTTPURLResponse, successRange.contains(httpResponse.statusCode) else {
                            // 오류처리
                            englishData.isGoToListView.toggle()
                            return
                        }
                        let newWords = try JSONDecoder().decode([String].self, from: data)
                        englishData.changeWords(newWords: newWords)
                    } catch {
                        //                        isGoToListView.toggle()
                        print(error)                  }
                }
            }, label: {
                Text("Load")
            })
            List {
                ForEach(englishData.englishWord.words, id: \.self) { word in
                    Text(word)
                }
            }
            .frame(maxWidth:300)
            .task {
                //                await englishData.reload()
            }
            Picker("", selection: $englishData.wordCount, content: {
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
        ListView()
    }
}
