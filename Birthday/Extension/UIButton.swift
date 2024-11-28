//
//  UIButton.swift
//  Birthday
//
//  Created by Olekssandr on 25/11/2024.
//

import UIKit

extension UIButton {
    convenience init(setTitle: String) {
    self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(setTitle, for: .normal)
        
    }
}
