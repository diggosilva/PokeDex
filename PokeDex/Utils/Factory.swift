//
//  Factory.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import UIKit

class Factory {
    
    static func buildLabel(text: String, fontSize: UIFont, textAlignment: NSTextAlignment = .center, textColor: UIColor = .black, backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = fontSize
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.layer.cornerRadius = cornerRadius
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }
    
    static func buildProgressView(progressTintColor: UIColor, progress: Float) -> UIProgressView {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = progressTintColor
        progressView.progress = progress
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.contentMode = .scaleAspectFit
        return progressView
    }
    
    static func buildVStackView(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat = 10) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.distribution = distribution
        stack.spacing = spacing
        return stack
    }
    
    static func buildHStackView(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, spacing: CGFloat = 20) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.distribution = distribution
        stack.spacing = spacing
//        stack.isLayoutMarginsRelativeArrangement = true
//        stack.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stack
    }
}
