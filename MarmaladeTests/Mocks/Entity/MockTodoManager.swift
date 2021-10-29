//
//  MockTodoManager.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation
@testable import Marmalade

class MockTodoManager:TodoManagerProtocol {

    var invokedAdd = false
    var invokedAddCount = 0
    var invokedAddParameters: (todo: Todo, Void)?
    var invokedAddParametersList = [(todo: Todo, Void)]()
    var stubbedAddResult: Bool! = false

    func add(todo: Todo) -> Bool {
        invokedAdd = true
        invokedAddCount += 1
        invokedAddParameters = (todo, ())
        invokedAddParametersList.append((todo, ()))
        return stubbedAddResult
    }

    var invokedGetAllTodos = false
    var invokedGetAllTodosCount = 0
    var stubbedGetAllTodosResult: [Todo]! = []

    func getAllTodos() -> [Todo] {
        invokedGetAllTodos = true
        invokedGetAllTodosCount += 1
        return stubbedGetAllTodosResult
    }

    var invokedDeleteAll = false
    var invokedDeleteAllCount = 0
    var stubbedDeleteAllResult: Bool! = false

    func deleteAll() -> Bool {
        invokedDeleteAll = true
        invokedDeleteAllCount += 1
        return stubbedDeleteAllResult
    }
}
