//
//  Todo.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation

struct Todo {
    let name:String
    let isDone: Bool
}
extension Todo {
    func ToModel() -> TodoModel {
        return TodoModel(name: self.name, isDone: self.isDone)
    }
}
