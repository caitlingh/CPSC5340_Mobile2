//
//  ContentView.swift
//  Assignment_1
//
//  Created by Caitlin Hendricks on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    
    var emojiOptions : [String] = ["😄", "😂", "😎", "😇", "😈"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(emojiOptions, id: \.self) {
                    emoji in HStack {
                        Text(emoji)
                            .padding(.trailing, -15)
                        ListItem()
                    }
                }
                
            }
            .navigationTitle(Text("Emoji Counter"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListItem: View {
    
    var text : String = "Counter: "
    @State var count : Int = 0
    
    var body: some View {
        HStack {
            Text(text)
            Text("\(count)")
            Spacer()
            Image(systemName: "plus.circle")
                .imageScale(.large)
                .onTapGesture {
                    count += 1
                }
            Image(systemName: "minus.circle")
                .imageScale(.large)
                .onTapGesture {
                    count -= 1
                }
        }
        .foregroundStyle(Color("theme"))
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
