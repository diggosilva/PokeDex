//
//  PokemonViewController.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import UIKit

class PokemonViewController: UIViewController {
    
    // MARK: - Properties
    private let pokemonView = PokemonView()
    private let pokemonViewModel: PokemonViewModel
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = pokemonView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupDelegatesAndDataSources()
        pokemonViewModel.getPokemon()
    }
    
    init(viewModel: PokemonViewModel = PokemonViewModel()) {
        self.pokemonViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.pokemonViewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods Setup
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
        return pokemonViewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else { return UICollectionViewCell() }
        cell.configure(model: pokemonViewModel.pokemons[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonSelected = pokemonViewModel.pokemons[indexPath.item]
        let viewModel = PokemonDetailViewModel(selectedPokemon: pokemonSelected)
        let detailsVC = PokemonDetailsViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailsVC, animated: true)
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

extension PokemonViewController: PokemonViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.pokemonView.collectionView.reloadData()
        }
    }
}
