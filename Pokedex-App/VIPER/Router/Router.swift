//
//  Router.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 5.10.2021.
//

import UIKit

// Router can route withing its own module
// Object
// Doesnt have any reference to anything else
// Entry point for our module
// This is where VIPER architecture starts

class UserRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        
        let router = UserRouter()
        
        // Assign V.I.P.
        
        let layout = UICollectionViewFlowLayout()
        let navController = UINavigationController(rootViewController: PokeViewController(collectionViewLayout: layout))
        
        var view: AnyView = navController
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
                
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
        
    }
    
}
//MARK: - NAVCONTROLLER EXTENSION

extension UINavigationController: AnyView {
    
    
    
    var presenter: AnyPresenter? {
        get {
            return self.presenter
        }
        set {
            newValue
        }
    }
    
    func update(with users: [User]) {
        
    }
    
    func update(with error: String) {
        
    }
    
    func update(with pokemons: [Pokemon]) {
        
    }
    
    
}
