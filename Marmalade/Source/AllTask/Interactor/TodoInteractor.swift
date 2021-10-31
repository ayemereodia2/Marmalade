//
//  TodoInteractor.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation

class TodoInteractor: TodoInteractorProtocol {
  
    var manager: TodoManagerProtocol?
    
    var presenter: TodoPresenterProtocol?
        
    func getAllTodosFromManager() {
        guard let manager = manager, let presenter = presenter else { return }
        let result = manager.getAllTodos() 
        presenter.show(all: result)
    }
    
    func create(todo: Todo) {
        guard let manager = manager, let presenter = presenter else { return }
       let _ = manager.add(todo: todo)
        let result = manager.getAllTodos() 
        presenter.show(all: result)
    }
    
    func edit(todo: Todo) {
        manager?.editTodo(item: todo)
        getAllTodosFromManager()
    }
}
