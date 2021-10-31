//
//  TodoObjectModel.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import RealmSwift

class TodoModel: Object {
    @Persisted var id = UUID().uuidString
    @Persisted var name: String
    @Persisted var isDone: Bool
    
    convenience init(name: String, isDone: Bool) {
        self.init()
        self.name = name
        self.isDone = isDone
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension TodoModel {
    func convertToDo() -> Todo {
        var todo = Todo(name: "", isDone: false)
        todo.id = self.id
        todo.name = self.name
        todo.isDone = self.isDone
        return todo
    }
}
