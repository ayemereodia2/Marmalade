//
//  NewTodoView.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import SwiftUI

struct NewTodoView: View {
    @State private var name:String = ""
    @Binding var isNewTask: Bool
    var body: some View {
        Form {
            Section {
                Text("What do you plan to do?")
            VStack(spacing: 20) {
                
                TextField("Enter your task", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                HStack {
                    Button("Cancel") {
                        isNewTask = false
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Save") {
                        
                    }
                    .padding()
            
                }
            }
        }
        }
        .cornerRadius(25.0)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(isNewTask: .constant(false))
    }
}
