//
//  MainTabView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/28.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var englishData: EnglishData
    
    var body: some View {
        TabView(content: {
            SelectView()
                .tabItem {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Find")
                }
            HistoryView()
                .badge(englishData.wordCount)
                .tabItem {
                    Image(systemName: "folder")
                    Text("History")
                }
        })
        .tabViewStyle(.automatic)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
