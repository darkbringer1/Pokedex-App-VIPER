//
//  Interactor.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 5.10.2021.
//

import Foundation

// Object
// Protocol
// Reference to presenter
// Get data or perform an interaction. When it completes, hand that data to presenter.
// Presenter will handle what to do with that data

// Sample json -> https://jsonplaceholder.typicode.com/users


class UserInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    
    let pokemonApi = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    let usersApi = "https://jsonplaceholder.typicode.com/users"
    
    
    func getUsers() {
        
//        print("Start Fetching Users")
//
//        guard let url = URL(string: usersApi) else { return }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
//                return
//            }
//            do {
//                let entities = try JSONDecoder().decode([User].self, from: data)
//                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
//
//            } catch {
//                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
//            }
//        }
//        task.resume()
    }
    
    func fetchPokemon() {
        
        print("Start Fetching Pokemon")
        
        guard let url = URL(string: pokemonApi) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchPokemons(with: .failure(FetchError.failed))
                return
            }
            do {
                let entities = try JSONDecoder().decode([Pokemon].self, from: data)
                self?.presenter?.interactorDidFetchPokemons(with: .success(entities))
                print(entities)
            } catch {
                self?.presenter?.interactorDidFetchPokemons(with: .failure(error))
            }
        }
        task.resume()
    }
}
