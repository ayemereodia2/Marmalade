//
//  TodoObjectModel.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import RealmSwift

class TodoModel: Object {
    @Persisted var name: String
    @Persisted var isDone: Bool
    
    convenience init(name: String, isDone: Bool) {
        self.init()
        self.name = name
        self.isDone = isDone
    }
}

extension TodoModel {
    func convertToDo() -> Todo {
        return Todo(name: self.name, isDone: self.isDone)
    }
}
