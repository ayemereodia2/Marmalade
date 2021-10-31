//
//  ContentView.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import SwiftUI

struct AllTaskView: View {

    @State var presenter: TodoPresenterProtocol?
    @ObservedObject var alltodo = Todos()
    @State private var isChecked:Bool = false
    @State private var isNewTask:Bool = false
    
    var body: some View {
        
        NavigationView {
            List { 
                ForEach(alltodo.todo, id: \.id) {
                    TodoRowView(todo: $0, presenter: $presenter)
                }
            }
            .onAppear {
                guard let presenter = presenter else { return }
                presenter.load()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                       isNewTask = true
                    } label: {
                        Image(systemName: "pencil")
                    }.fullScreenCover(isPresented: $isNewTask, content: {
                        
                        NewTodoView(isNewTask: $isNewTask, presenter: $presenter)
                    })
                }
            }
            .navigationTitle("My to do list")
            .navigationBarTitleDisplayMode(.large)
        }
            
    }
}

extension AllTaskView: TodoViewProtocol {
    func display(all: [Todo]) {
            alltodo.todo = all
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllTaskView(alltodo: Todos())
    }
}

struct BlankBackgroundView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("No todos")
        }
    }
}

struct TodoRowView: View {
    let todo:Todo
    @Binding var presenter:TodoPresenterProtocol?
    var body: some View {
        HStack {
            Button { 
                presenter?.modify(todo: todo)
            } label: {
                Image(systemName: todo.isDone  ? "checkmark.square" : "square")
            }
            Text(todo.name)
                .padding()
        }
    }
}
