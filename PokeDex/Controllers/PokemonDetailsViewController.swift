//
//  PokemonDetailsViewController.swift
//  PokeDex
//
//  Created by Diggo Silva on 19/11/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    private let detailView = PokemonDetailView()
    private let viewModel: PokemonDetailViewModel
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.configure(model: viewModel.selectedPokemon)
    }
    
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
