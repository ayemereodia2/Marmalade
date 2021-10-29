//
//  TodoWireFrame.swift
//  Marmalade
//
//  Created by Ayemere  Odia  on 29/10/2021.
//

import Foundation

class TodoWireFrame: TodoWireframeProtocol {
    
    static func build() -> AllTaskView {
        let entity = TodoManager()
        let interactor = TodoInteractor()
        let presenter = TodoPresenter()

        interactor.presenter = presenter
        interactor.manager = entity
        presenter.interactor = interactor
        let view = AllTaskView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view

        return view
    }
    
    
}
