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

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parsedDataString = dataString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
