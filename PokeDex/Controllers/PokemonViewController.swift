//
//  PokemonViewController.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import UIKit

class PokemonViewController: UIViewController {
    
    private let pokemonView = PokemonView()
    private let pokemonViewModel = PokemonViewModel.shared
    private var pokemons: [PokemonResult] = []
    
    override func loadView() {
        super.loadView()
        view = pokemonView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupDelegatesAndDataSources()
        pokemonViewModel.fetchPokemon { pokemonResult in
            DispatchQueue.main.async {
                self.pokemons = pokemonResult
                self.pokemonView.collectionView.reloadData()
            }
        }
    }
    
    private func setupNavBar() {
        title = "Pokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegatesAndDataSources() {
        pokemonView.collectionView.delegate = self
        pokemonView.collectionView.dataSource = self
    }
}

extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else { return UICollectionViewCell() }
        cell.configure(model: pokemons[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 100)
    }
    
    //MARK: - Espaço VERTICAL
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    //MARK: - Espaço HORIZONTAL
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
