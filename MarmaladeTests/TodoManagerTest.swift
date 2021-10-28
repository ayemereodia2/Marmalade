//
//  TodoManagerTest.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 28/10/2021.
//

import XCTest
@testable import Marmalade

class TodoManagerTest: XCTestCase {

    func testAddTodoReturnsTrueWhenSaveIsSuccessfull() {
        let testableManager = TestableTodoManager()
    
        XCTAssertEqual(testableManager.mockDb.invokedCreateCount, 0)
        let _ = testableManager.add(todo: Todo(name: "Boil", isDone: false))
        XCTAssertEqual(testableManager.mockDb.invokedCreateCount, 1)
    }

    func testGetAllTaskReturnsAllTasks() {
        let testableManager = TestableTodoManager()   
        _ = testableManager.deleteAll()
         _ = testableManager.add(todo: Todo(name: "BoilSmash", isDone: false))
        _ = testableManager.getAllTodos()
        XCTAssertEqual(testableManager.mockDb.invokedGetallCount, 1)
    }
}


class RealmDbTest: XCTestCase {
    
    func testCreateReturnsTrueWhenSuccessfull() {
        let realm = RealmDb()
        let result =  realm.create(todo: Todo(name: "Washing", isDone: false))
        XCTAssertTrue(result)
    }
    
    func testGetAllTaskReturnsTaskCountGreaterThanZero() {
        let realm = RealmDb()
        _ = realm.deteleAll()
        _ = realm.create(todo: Todo(name: "Washing", isDone: false))
        let result =  realm.getall()
        XCTAssertEqual(result.count, 1)
    }
}

private class TestableTodoManager: TodoManager {
    let mockDb = MockTodoEntity()
    
    override var realmDb: TodoEntityProtocol {
        get { mockDb }
    }
}
