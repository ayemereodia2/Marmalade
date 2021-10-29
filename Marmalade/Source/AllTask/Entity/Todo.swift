//
//  Todo.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    let name:String
    let isDone: Bool
}
extension Todo {
    func ToModel() -> TodoModel? {
        return TodoModel(name: name, isDone: isDone)
    }
}


class Todos: ObservableObject {
    @Published var todo:[Todo] = []
}
