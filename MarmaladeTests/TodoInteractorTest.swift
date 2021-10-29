//
//  TodoInteractorTest.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import XCTest
@testable import Marmalade

class TodoInteractorTest: XCTestCase {
    
    func testGetAllTodoCallsEntityGetAll() {
        let interactor = TestableTodoInteractor()
        XCTAssertEqual(interactor.mockManager.invokedGetAllTodosCount, 0)
        let _ = interactor.getAllTodosFromManager()
        XCTAssertEqual(interactor.mockManager.invokedGetAllTodosCount, 1)
    }
    
    func testGetAllTodoCallsPresenterShowAllTodos() {
        let interactor = TestableTodoInteractor()
        XCTAssertEqual(interactor.mockPresenter.invokedShowCount, 0)
        let _ = interactor.getAllTodosFromManager()
        XCTAssertEqual(interactor.mockPresenter.invokedShowCount, 1)
    }
}

private class TestableTodoInteractor: TodoInteractor {
    let mockManager = MockTodoManager()
    let mockPresenter = MockTodoPresenter()
    
    override init() {
        super.init()
        self.manager = mockManager
        self.presenter = mockPresenter
    }
}
