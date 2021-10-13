//
//  Presenter.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 5.10.2021.
//

import Foundation

// Glue that ties everything together

// Object
// Protocol
// Holds all the references to Interactor, Router and View
// Needs to present to view and tell the view what to do

class UserPresenter: AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
            interactor?.fetchPokemon()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
            case .success(let users):
                view?.update(with: users)
            case .failure:
                view?.update(with: "Something went wrong")
        }
    }
    
    func interactorDidFetchPokemons(with result: Result<[Pokemon], Error>) {
        switch result {
            case .success(let pokemons):
                view?.update(with: pokemons)
            case .failure:
                view?.update(with: "Interactor Couldn't fetch Pokemons")
        }
    }
    
    
    
}
