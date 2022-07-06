//
//  EnglishData.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import Foundation

let successRange = 200..<300

class EnglishData: ObservableObject {
    @Published var wordCount: Int = 0
    @Published var words: [String] = []
    
    func reload() async {
        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(self.wordCount)")!
        let urlSession = URLSession.shared
        do {
            let (data, response) = try await urlSession.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, successRange.contains(httpResponse.statusCode) else {
                // 오류처리
                return
            }
            self.words = try JSONDecoder().decode([String].self, from: data)
        } catch {
            // 오류처리
            print(error)
        }
    }
}
