//
//  SelectView.swift
//  EnglishCollector
//
//  Created by KimJS on 2022/06/27.
//

import SwiftUI

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
