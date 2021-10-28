//
//  ContentView.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import SwiftUI

struct AllTaskView: View {
    @State private var isChecked:Bool = false
    @State private var isNewTask:Bool = false

    var body: some View {
        
        NavigationView {
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack {
                    Button { self.isChecked = true } label: {
                        Image(systemName: isChecked ? "checkmark.square" : "square")
                    }
                    Text("Hello, world!")
                        .padding()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        self.isNewTask = true
                    } label: {
                        Image(systemName: "pencil")
                    }.fullScreenCover(isPresented: $isNewTask, content: {
                        NewTodoView(isNewTask: $isNewTask)
                    })
                }
            }
            .navigationTitle("My to do list")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllTaskView()
    }
}
