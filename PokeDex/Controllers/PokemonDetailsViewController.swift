//
//  PokemonDetailsViewController.swift
//  PokeDex
//
//  Created by Diggo Silva on 19/11/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var fakePage: UIView = {
        let fakePage = UIView()
        fakePage.translatesAutoresizingMaskIntoConstraints = false
        fakePage.backgroundColor = .white
        fakePage.layer.cornerRadius = 30
        fakePage.layer.opacity = 0.9
        return fakePage
    }()
    
    lazy var nameLabel: UILabel = {
        Factory.buildLabel(text: "", fontSize: .systemFont(ofSize: 30, weight: .regular))
    }()
    
    lazy var typeLabel: UILabel = {
        Factory.buildLabel(text: "", fontSize: .systemFont(ofSize: 18, weight: .semibold), textColor: .white, backgroundColor: .systemGreen, cornerRadius: 17.5)
    }()
    
    lazy var descriptionLabel: UILabel = {
        Factory.buildLabel(text: "", fontSize: .systemFont(ofSize: 14, weight: .regular), textAlignment: .left)
    }()
    
    lazy var statsLabel: UILabel = {
        Factory.buildLabel(text: "Stats", fontSize: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .left)
    }()
    
    //MARK: - Stack VERTICAL Labels
    lazy var heightLabel: UILabel = {
        Factory.buildLabel(text: "Altura", fontSize: .systemFont(ofSize: 16, weight: .semibold), textColor: .systemGray)
    }()
    
    lazy var attackLabel: UILabel = {
        Factory.buildLabel(text: "Ataque", fontSize: .systemFont(ofSize: 16, weight: .semibold), textColor: .systemGray)
    }()
    
    lazy var defenseLabel: UILabel = {
        Factory.buildLabel(text: "Defesa", fontSize: .systemFont(ofSize: 16, weight: .semibold), textColor: .systemGray)
    }()
    
    lazy var weightLabel: UILabel = {
        Factory.buildLabel(text: "Peso", fontSize: .systemFont(ofSize: 16, weight: .semibold), textColor: .systemGray)
    }()
    
    lazy var verticalLabelsStackView: UIStackView = {
        Factory.buildVStackView(arrangedSubviews: [heightLabel, attackLabel, defenseLabel, weightLabel], axis: .vertical, distribution: .fillEqually)
    }()
    
    //MARK: - Stack VERTICAL VALUE Labels
    lazy var heightValueLabel: UILabel = {
        Factory.buildLabel(text: "7", fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var attackValueLabel: UILabel = {
        Factory.buildLabel(text: "49", fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var defenseValueLabel: UILabel = {
        Factory.buildLabel(text: "54", fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var weightValueLabel: UILabel = {
        Factory.buildLabel(text: "69", fontSize: .systemFont(ofSize: 16, weight: .semibold))
    }()
    
    lazy var verticalValueLabelsStackView: UIStackView = {
        Factory.buildVStackView(arrangedSubviews: [heightValueLabel, attackValueLabel, defenseValueLabel, weightValueLabel], axis: .vertical, distribution: .fillEqually)
    }()
    
    //MARK: - Stack VERTICAL ProgressView
    lazy var heightProgressView: UIProgressView = {
        Factory.buildProgressView(progressTintColor: .systemOrange, progress: 0)
    }()
    
    lazy var attackProgressView: UIProgressView = {
        Factory.buildProgressView(progressTintColor: .systemRed, progress: 0)
    }()
    
    lazy var defenseProgressView: UIProgressView = {
        Factory.buildProgressView(progressTintColor: .systemTeal, progress: 0)
    }()
    
    lazy var weightProgressView: UIProgressView = {
        Factory.buildProgressView(progressTintColor: .systemIndigo, progress: 0)
    }()
    
    lazy var verticalProgressStackView: UIStackView = {
        Factory.buildVStackView(arrangedSubviews: [heightProgressView, attackProgressView, defenseProgressView, weightProgressView], axis: .vertical, distribution: .fillEqually)
    }()
    
    //MARK: - Stack HORIZONTAL
    lazy var statsHStackView: UIStackView = {
        Factory.buildHStackView(arrangedSubviews: [verticalLabelsStackView, verticalValueLabelsStackView, verticalProgressStackView], axis: .horizontal, distribution: .fill)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func configure(model: PokemonResult) {
        guard let url = URL(string: model.imageURL) else { return }
        DispatchQueue.main.async {
            self.imageView.sd_setImage(with: url)
            self.nameLabel.text = model.name
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        view.backgroundColor = .systemYellow
        view.addSubviews(views: [fakePage, imageView, nameLabel, typeLabel, descriptionLabel, statsLabel, statsHStackView])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            fakePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            fakePage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fakePage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fakePage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: fakePage.topAnchor, constant: -160),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: fakePage.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: fakePage.trailingAnchor, constant: -10),
            
            typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typeLabel.widthAnchor.constraint(equalToConstant: 100),
            typeLabel.heightAnchor.constraint(equalToConstant: 35),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            statsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            statsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statsLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            statsHStackView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            statsHStackView.topAnchor.constraint(equalTo: statsLabel.bottomAnchor, constant: 10),
            statsHStackView.leadingAnchor.constraint(equalTo: fakePage.leadingAnchor, constant: 30),
            statsHStackView.trailingAnchor.constraint(equalTo: fakePage.trailingAnchor, constant: -30),
        ])
    }
}
