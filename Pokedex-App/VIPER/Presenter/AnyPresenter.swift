//
//  AnyPresenter.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 12.10.2021.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func interactorDidFetchPokemons(with result: Result<[Pokemon], Error>)
}
