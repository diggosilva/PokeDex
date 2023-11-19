//
//  PokemonCell.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import UIKit
import SDWebImage

class PokemonCell: UICollectionViewCell {
    
    static let identifier = "PokedexCell"
    
    lazy var cardImage: UIView = {
        let cardImage = UIView()
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.backgroundColor = .systemGreen
        cardImage.layer.cornerRadius = 15
        cardImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardImage.layer.shadowOpacity = 1
        cardImage.layer.shadowRadius = 7.5
        cardImage.layer.shadowColor = UIColor.systemGreen.cgColor
        return cardImage
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        Factory.buildLabel(text: "", fontSize: .systemFont(ofSize: 14, weight: .bold), textColor: .white)
    }()
    
    lazy var typeLabel: UILabel = {
        Factory.buildLabel(text: "", fontSize: .systemFont(ofSize: 14, weight: .bold), textColor: .white, backgroundColor: UIColor(white: 1, alpha: 0.5), cornerRadius: 15)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: PokemonResult) {
        guard let url = URL(string: model.imageURL) else { return }
        DispatchQueue.main.async {
            self.imageView.sd_setImage(with: url)
            self.nameLabel.text = model.name.capitalized
            self.typeLabel.text = model.type.capitalized
            self.cardImage.backgroundColor = self.colorsForTypes(type: model.type)
            self.cardImage.layer.shadowColor = self.colorsForTypes(type: model.type).cgColor
        }
    }
    
    func colorsForTypes(type: String) -> UIColor {
        switch type {
        case "poison": return UIColor.systemGreen
        case "fire": return UIColor.systemRed
        case "water": return UIColor.systemCyan
        case "bug": return UIColor.systemBrown
        case "flying": return UIColor.systemBlue
        case "electric": return UIColor.systemYellow
        case "ground": return UIColor.systemGray
        case "fairy": return UIColor.systemPink
        case "grass": return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case "fighting": return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case "psychic": return UIColor.systemIndigo
        case "steel": return #colorLiteral(red: 0.7343749404, green: 0.7343749404, blue: 0.7343749404, alpha: 1)
        case "ice": return #colorLiteral(red: 0.4832615852, green: 0.8721074462, blue: 1, alpha: 1)
        case "rock": return UIColor.systemTeal
        case "dragon": return UIColor.systemPurple
        default:
            return UIColor.magenta
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubviews(views: [cardImage, imageView, nameLabel, typeLabel])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: cardImage.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant: 8),
            
            typeLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8),
            typeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            imageView.bottomAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: -4),
            imageView.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: -4),
            imageView.widthAnchor.constraint(equalToConstant: 68),
            imageView.heightAnchor.constraint(equalToConstant: 68),
        ])
    }
}
