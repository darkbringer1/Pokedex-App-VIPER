//
//  PokeView.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 12.10.2021.
//

import UIKit

private let reuseIdentifier = "PokedexCell"

class PokeViewController: UICollectionViewController, AnyView {
    
    
    
//    var collectionView: UICollectionView!
    
    var presenter: AnyPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    @objc func showSearchBar() {
        print("Search button pressed")
    }
        
    func configureViewComponents() {
        
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBlue

        view.addSubview(collectionView)
        
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.title = "Pokemons"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    var pokemons: [Pokemon] = []
    
    func update(with users: [User]) {
        print("got users")
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.pokemons = []
            self.collectionView.isHidden = true
        }
    }
    func update(with pokemons: [Pokemon]) {
        print("Got pokemons")
        DispatchQueue.main.async {
            self.pokemons = pokemons
            self.collectionView.reloadData()
            self.collectionView.isHidden = false
        }
    }
    
}

extension PokeViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        cell.backgroundColor = .systemPink
        return cell
    }
}


extension PokeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 3

        return CGSize(width: width, height: width)
        
    }
}
