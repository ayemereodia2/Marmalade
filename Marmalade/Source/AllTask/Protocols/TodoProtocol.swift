//
//  TodoProtocol.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation

protocol TodoWireframeProtocol {
    static func build() -> AllTaskView
}
protocol TodoViewProtocol {
    var presenter: TodoPresenterProtocol? { get set }
    func display(all: [Todo])
}

protocol TodoPresenterProtocol: AnyObject {
    var view:TodoViewProtocol? { get set }
    var interactor:TodoInteractorProtocol? { get set }
    func show(all: [Todo])
    func load()
    func make(todo: Todo)
}

protocol TodoInteractorProtocol {
    var manager: TodoManagerProtocol? { get set }
    var presenter: TodoPresenterProtocol? { get set }
    func getAllTodosFromManager()
    func create(todo: Todo)
}

protocol TodoEntityProtocol {
    func create(todo: Todo) -> Bool
    func getall() -> [TodoModel] 
    func deteleAll() -> Bool
}

protocol TodoManagerProtocol {
    func add(todo: Todo) -> Bool
    func getAllTodos() -> [Todo]
    func deleteAll() -> Bool
}
