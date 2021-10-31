//
//  MockTodoInteractor.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation
@testable import Marmalade

class MockTodoInteractor: TodoInteractorProtocol {

    var invokedManagerSetter = false
    var invokedManagerSetterCount = 0
    var invokedManager: TodoManagerProtocol?
    var invokedManagerList = [TodoManagerProtocol?]()
    var invokedManagerGetter = false
    var invokedManagerGetterCount = 0
    var stubbedManager: TodoManagerProtocol!

    var manager: TodoManagerProtocol? {
        set {
            invokedManagerSetter = true
            invokedManagerSetterCount += 1
            invokedManager = newValue
            invokedManagerList.append(newValue)
        }
        get {
            invokedManagerGetter = true
            invokedManagerGetterCount += 1
            return stubbedManager
        }
    }

    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: TodoPresenterProtocol?
    var invokedPresenterList = [TodoPresenterProtocol?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: TodoPresenterProtocol!

    var presenter: TodoPresenterProtocol? {
        set {
            invokedPresenterSetter = true
            invokedPresenterSetterCount += 1
            invokedPresenter = newValue
            invokedPresenterList.append(newValue)
        }
        get {
            invokedPresenterGetter = true
            invokedPresenterGetterCount += 1
            return stubbedPresenter
        }
    }

    var invokedGetAllTodosFromManager = false
    var invokedGetAllTodosFromManagerCount = 0

    func getAllTodosFromManager() {
        invokedGetAllTodosFromManager = true
        invokedGetAllTodosFromManagerCount += 1
    }

    var invokedCreate = false
    var invokedCreateCount = 0
    var invokedCreateParameters: (todo: Todo, Void)?
    var invokedCreateParametersList = [(todo: Todo, Void)]()

    func create(todo: Todo) {
        invokedCreate = true
        invokedCreateCount += 1
        invokedCreateParameters = (todo, ())
        invokedCreateParametersList.append((todo, ()))
    }
}
