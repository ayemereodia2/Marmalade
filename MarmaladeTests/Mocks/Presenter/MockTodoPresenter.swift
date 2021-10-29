//
//  MockTodoPresenter.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation
@testable import Marmalade

class MockTodoPresenter: TodoPresenterProtocol {

    var invokedViewSetter = false
    var invokedViewSetterCount = 0
    var invokedView: TodoViewProtocol?
    var invokedViewList = [TodoViewProtocol?]()
    var invokedViewGetter = false
    var invokedViewGetterCount = 0
    var stubbedView: TodoViewProtocol!

    var view:TodoViewProtocol? {
        set {
            invokedViewSetter = true
            invokedViewSetterCount += 1
            invokedView = newValue
            invokedViewList.append(newValue)
        }
        get {
            invokedViewGetter = true
            invokedViewGetterCount += 1
            return stubbedView
        }
    }

    var invokedInteractorSetter = false
    var invokedInteractorSetterCount = 0
    var invokedInteractor: TodoInteractorProtocol?
    var invokedInteractorList = [TodoInteractorProtocol?]()
    var invokedInteractorGetter = false
    var invokedInteractorGetterCount = 0
    var stubbedInteractor: TodoInteractorProtocol!

    var interactor:TodoInteractorProtocol? {
        set {
            invokedInteractorSetter = true
            invokedInteractorSetterCount += 1
            invokedInteractor = newValue
            invokedInteractorList.append(newValue)
        }
        get {
            invokedInteractorGetter = true
            invokedInteractorGetterCount += 1
            return stubbedInteractor
        }
    }

    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (all: [Todo], Void)?
    var invokedShowParametersList = [(all: [Todo], Void)]()

    func show(all: [Todo]) {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (all, ())
        invokedShowParametersList.append((all, ()))
    }

    var invokedLoad = false
    var invokedLoadCount = 0

    func load() {
        invokedLoad = true
        invokedLoadCount += 1
    }

    var invokedMake = false
    var invokedMakeCount = 0
    var invokedMakeParameters: (todo: Todo, Void)?
    var invokedMakeParametersList = [(todo: Todo, Void)]()

    func make(todo: Todo) {
        invokedMake = true
        invokedMakeCount += 1
        invokedMakeParameters = (todo, ())
        invokedMakeParametersList.append((todo, ()))
    }
}
