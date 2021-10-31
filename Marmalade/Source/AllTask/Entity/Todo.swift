//
//  Todo.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID().uuidString
    var name:String
    var isDone: Bool
}
extension Todo {
    func ToModel() -> TodoModel? {
        let model = TodoModel()
        model.id = self.id
        model.name = self.name
        model.isDone = self.isDone
        return model
    }
}


class Todos: ObservableObject {
    @Published var todo:[Todo] = []
}
