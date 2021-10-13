//
//  AnyView.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 12.10.2021.
//

import Foundation

protocol AnyView {
    
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
    
    func update(with pokemons: [Pokemon])
    
}
