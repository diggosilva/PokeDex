//
//  Colors.swift
//  PokeDex
//
//  Created by Diggo Silva on 12/12/23.
//

import UIKit

final class Colors {
    
    static func colorsForTypes(type: String) -> UIColor {
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
}
