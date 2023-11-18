//
//  Extensions.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach({ self.addSubview($0) })
    }
}
