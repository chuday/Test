//
//  ContentView.swift
//  Test
//
//  Created by Mikhail Chudaev on 09.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .font(Font.custom("MarkPro-Bold", size: 30))
                    .padding()
                Button {
                    print("main")
                } label: {
                    NavigationLink(destination: Main(text: .constant(""))) {
                        Text("Go to main")
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
