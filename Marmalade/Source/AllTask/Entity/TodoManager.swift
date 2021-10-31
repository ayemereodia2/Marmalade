//
//  TodoManager.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation
import RealmSwift

class TodoManager: TodoManagerProtocol {

    private(set) lazy var realmDb: TodoEntityProtocol = {
        RealmDb()
    }()
    
    func add(todo: Todo) -> Bool {
        realmDb.create(todo: todo)
    }
    
    func getAllTodos() -> [Todo] {
        let todos = realmDb.getall().map {
            $0.convertToDo()
        }
        return todos
    }
    
    func deleteAll() -> Bool {
      return  realmDb.deteleAll()
    }
    
    func editTodo(item: Todo) {
        realmDb.editTodo(item: item)
    }
}

class RealmDb: TodoEntityProtocol {
    
    private var realConnect: Realm
    
     init() {
      realConnect = try! Realm()
     }
    
    func create(todo: Todo) -> Bool {
        guard let model = todo.ToModel() else { return false }
        do {
            try realConnect.write {
                realConnect.add(model)
            }
        } catch let error {
            print(error)
            return false
        }
        return true
    }
    
    func getall() -> [TodoModel] {
        let result = realConnect.objects(TodoModel.self)
        var todo = [TodoModel]()
        for item in result {
            todo.append(item)
        }
        return todo
    }
    
    func deteleAll() -> Bool {
        do {
            try realConnect.write {
                realConnect.deleteAll()
            }
        }
        catch let error {
            print(error)
            return false
        }
        return true
        
    }
    
    func editTodo(item: Todo) {
        guard let itemTemp = item.ToModel() else {
            return
        }
        let result = realConnect.object(ofType: TodoModel.self, forPrimaryKey: itemTemp.id)
        do {
            try realConnect.write {
                result?.isDone = !itemTemp.isDone
                realConnect.add(result!, update: .modified)
            }
        }catch {
            
        }
        
    }
}
