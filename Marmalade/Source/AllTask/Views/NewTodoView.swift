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
    @Binding var presenter: TodoPresenterProtocol?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack(spacing: 20) {
                Text("What do you plan to do?")
                TextField("Enter your task", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                    }
                    
                    Spacer()
                    
                    ButtonView(title: "Save", backgroundColor: .blue, foregroundColor: .white){
                        isNewTask.toggle()
                        presentationMode.wrappedValue.dismiss()
                    }            
                }
                Spacer()
            }
            .onDisappear {
                guard isNewTask else { return }
                presenter?.make(todo: Todo(name: name, isDone: false))
            }
            .padding()
    }
    
    
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(isNewTask: .constant(false), presenter: .constant(TodoPresenter()))
    }
}

struct ButtonView: View {
    @State var title:String
    @State var backgroundColor: Color
    @State var foregroundColor: Color
    var action: () -> ()

    var body: some View {
        Button(title, action: {
            action()
        }) 
            .padding([.leading, .trailing], 50)
            .padding([.top, .bottom], 10)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 6, height: 6)))
        .shadow(radius: 8)
    }
}
