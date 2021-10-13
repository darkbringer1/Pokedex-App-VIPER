//
//  Router.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 5.10.2021.
//

import UIKit

typealias EntryPoint = UIViewController & AnyView

// Router can route withing its own module
// Object
// Doesnt have any reference to anything else
// Entry point for our module
// This is where VIPER architecture starts

protocol  AnyRouter { //Common naming convention for protocols
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
    
}


class UserRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign V.I.P.
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
        
    }
    
    
}
