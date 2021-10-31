//
//  MockTodoView.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation
@testable import Marmalade

class MockTodoView: TodoViewProtocol {

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

    var invokedDisplay = false
    var invokedDisplayCount = 0
    var invokedDisplayParameters: (all: [Todo], Void)?
    var invokedDisplayParametersList = [(all: [Todo], Void)]()

    func display(all: [Todo]) {
        invokedDisplay = true
        invokedDisplayCount += 1
        invokedDisplayParameters = (all, ())
        invokedDisplayParametersList.append((all, ()))
    }
}
