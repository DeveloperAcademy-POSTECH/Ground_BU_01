//
//  EnglishData.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import Foundation

let successRange = 200..<300

class EnglishData: ObservableObject {
    @Published var englishWord = EnglishWord()
    @Published var wordCount: Int = 0
    @Published var isGoToListView: Bool = false
    
    // 영단어 전부를 업데이트 할 때 쓰는 함수입니다.
    func changeWords(newWords: [String]) -> () {
        englishWord.words = newWords
    }
    
    // 영단어 일부만 업데이트 할 때 쓰는 함수입니다.
    func changeWord(at index: Int, newWord: String) -> () {
        englishWord.words[index] = newWord
    }
    
    // 쓰이지 않는 함수입니다.
    func reload() async {
        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(self.wordCount)")!
        let urlSession = URLSession.shared
        do {
            let (data, response) = try await urlSession.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, successRange.contains(httpResponse.statusCode) else {
                // 오류처리
                return
            }
            self.englishWord.words = try JSONDecoder().decode([String].self, from: data)
        } catch {
            // 오류처리
            print(error)
        }
    }
}
