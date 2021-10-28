//
//  MockTodoEntity.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import Foundation
@testable import Marmalade

class MockTodoEntity: TodoEntityProtocol {

    var invokedCreate = false
    var invokedCreateCount = 0
    var invokedCreateParameters: (todo: Todo, Void)?
    var invokedCreateParametersList = [(todo: Todo, Void)]()
    var stubbedCreateResult: Bool! = false

    func create(todo: Todo) -> Bool {
        invokedCreate = true
        invokedCreateCount += 1
        invokedCreateParameters = (todo, ())
        invokedCreateParametersList.append((todo, ()))
        return stubbedCreateResult
    }

    var invokedGetall = false
    var invokedGetallCount = 0
    var stubbedGetallResult: [TodoModel]! = []

    func getall() -> [TodoModel] {
        invokedGetall = true
        invokedGetallCount += 1
        return stubbedGetallResult
    }

    var invokedDeteleAll = false
    var invokedDeteleAllCount = 0
    var stubbedDeteleAllResult: Bool! = false

    func deteleAll() -> Bool {
        invokedDeteleAll = true
        invokedDeteleAllCount += 1
        return stubbedDeteleAllResult
    }
}
