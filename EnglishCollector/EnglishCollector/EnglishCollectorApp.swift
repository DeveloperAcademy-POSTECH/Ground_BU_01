//
//  EnglishCollectorApp.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import SwiftUI

@main
struct EnglishCollectorApp: App {
    @StateObject private var englishData: EnglishData = EnglishData()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(englishData)
        }
    }
}
