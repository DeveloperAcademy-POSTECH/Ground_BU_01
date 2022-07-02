//
//  SelectView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import SwiftUI
//1. 첫 화면을 TabView로 바꿔주세요, 현재 홈화면은 첫번째 탭으로 이동하고, 두번째 탭에서는 내가 앱을 켜고 찾았던 단어들의 히스토리가 나옵니다
//2. 단어 목록 화면에서 하나의 단어를 선택하면 해당 단어를 수정하는 기능을 추가해주세요
struct SelectView: View {
    @EnvironmentObject var englishData : EnglishData
    @State var isGoToListView: Bool = false
    var body: some View {
        NavigationView(content: {
            VStack {
                Text("Chosen number: \(englishData.wordCount)")
                    .font(.headline)
                Picker("", selection: $englishData.wordCount, content: {
                    ForEach(1...15, id: \.self) {
                        Text("\($0)")
                    }
                })
                .frame(maxWidth: 200)
                .pickerStyle(.wheel)
                
                NavigationLink(isActive:$isGoToListView,
                destination: {
                    ListView(isGoToListView: $isGoToListView)
                }, label: {
                    EmptyView()
                })
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.2)
                        .cornerRadius(20)
                    Text("Next")
                        .font(.body)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            isGoToListView.toggle()
                        }
                }
                .frame(width: 100, height: 40, alignment: .center)
                .aspectRatio(contentMode: .fit)
                Spacer()
            }
        })
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
