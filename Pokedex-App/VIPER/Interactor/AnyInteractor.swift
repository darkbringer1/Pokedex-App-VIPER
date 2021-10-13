//
//  AnyInteractor.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 12.10.2021.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
    func fetchPokemon()
    
}
