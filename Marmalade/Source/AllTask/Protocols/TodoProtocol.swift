//
//  TodoProtocol.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation

protocol TodoWireframeProtocol {
    func build()
}
protocol TodoViewProtocol {
    var presenter: TodoPresenterProtocol? { get set }
}

protocol TodoPresenterProtocol {
    var interactor: TodoInteractorProtocol? { get set }
}

protocol TodoInteractorProtocol {
    var entity: TodoEntityProtocol? { get set }
}

protocol TodoEntityProtocol {
    func create(todo: Todo) -> Bool
    func getall() -> [TodoModel] 
    func deteleAll() -> Bool
}
