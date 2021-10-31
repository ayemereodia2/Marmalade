//
//  TodoPresenter.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation

class TodoPresenter: TodoPresenterProtocol {
        
    var view: TodoViewProtocol?

    var interactor: TodoInteractorProtocol?
    
    func show(all: [Todo]) {
        view?.display(all: all) 
    }
    
    func load() {
        interactor?.getAllTodosFromManager()
    }
    
    func make(todo: Todo){
        interactor?.create(todo: todo)
    }
    
    func modify(todo: Todo) {
        interactor?.edit(todo: todo)
    }
    
    func clearAll() {
        interactor?.deleteAll()
    }
}
