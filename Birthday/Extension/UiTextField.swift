//
//  UiTextField.swift
//  Birthday
//
//  Created by Olekssandr on 30/11/2024.
//

import UIKit

extension UITextField {
    convenience  init(placeholder: String ) {
        self.init()
        self.placeholder = placeholder
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
    }
}
