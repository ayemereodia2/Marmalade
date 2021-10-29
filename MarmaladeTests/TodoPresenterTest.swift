//
//  TodoPresenterTest.swift
//  MarmaladeTests
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import XCTest
@testable import Marmalade

class TodoPresenterTest: XCTestCase {
    
    func testLoadInPresenterCallsgetAllTodosFromManager() {
        let presenter = TestablePresenter()
        XCTAssertEqual(presenter.mockInteractor.invokedGetAllTodosFromManagerCount, 0)
        presenter.load()
        XCTAssertEqual(presenter.mockInteractor.invokedGetAllTodosFromManagerCount, 1)
    }
    
    func testShowInPresenterCallsDisplay() {
        let presenter = TestablePresenter()
        XCTAssertEqual(presenter.mockView.invokedDisplayCount, 0)
        presenter.show(all: [Todo(name: "Arrange", isDone: true)])
        XCTAssertEqual(presenter.mockView.invokedDisplayCount, 1)
    }
}

private class TestablePresenter: TodoPresenter {
    let mockView = MockTodoView()
    let mockInteractor = MockTodoInteractor()
    
    override init() {
        super.init()
        self.view = mockView
        self.interactor = mockInteractor
    }

}
