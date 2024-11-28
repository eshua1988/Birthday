//
//  UILable.swift
//  Birthday
//
//  Created by Olekssandr on 24/11/2024.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self .init()
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
