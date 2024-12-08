//
//  RegistrationViewController.swift
//  Birthday
//
//  Created by Olekssandr on 30/11/2024.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    let loginTextField: UITextField = {
        let textField = UITextField(placeholder: "Login")
        return textField
    }()
    
    let passwordTextFild: UITextField = {
        let textField = UITextField(placeholder: "Password")
        
        return textField
    }()
    var continueButton: UIButton = {
        let button = UIButton(setTitle: "Continue")
        button.backgroundColor = .systemBlue
        return button
    }()
    var forgotButton: UIButton = {
        let button = UIButton(setTitle: "Forgot password?")
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    var signUpButton: UIButton = {
        let button = UIButton(setTitle: "Sign Up?")
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    var logWithoutRegistrButton: UIButton = {
        let button = UIButton(setTitle: "Log in without registration")
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    let welkomLable: UILabel = {
        let lable = UILabel(text: "Welcome")
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 30)
        return lable
    }()
    
    let singUpTextLable: UILabel = {
        let lable = UILabel(text: "Don't have an account?")
        // lable.font = UIFont.systemFont(ofSize: 14)
        return lable
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstrain()
        view.backgroundColor = .white
        logWithoutRegistrButton.addTarget(self, action: #selector(logWithoutRegistration), for: .touchUpInside)
    }
    @objc func logWithoutRegistration () {
        navigationController?.pushViewController(MainTabBar(), animated: true)
       // навигация которая закрывает navigation bar
         navigationController?.isNavigationBarHidden = true
    }
}
extension RegistrationViewController {
    func setConstrain() {
        view.addSubview(passwordTextFild)
        NSLayoutConstraint.activate([
            passwordTextFild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            passwordTextFild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            passwordTextFild.heightAnchor.constraint(equalToConstant: 50),
            passwordTextFild.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110)
        ])
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextFild.topAnchor, constant: -11),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        view.addSubview(welkomLable)
        NSLayoutConstraint.activate([
            welkomLable.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -31),
            welkomLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        view.addSubview(forgotButton)
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: passwordTextFild.bottomAnchor, constant: 25),
            forgotButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        ])
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 25),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(singUpTextLable)
        NSLayoutConstraint.activate([
            singUpTextLable.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 33),
            singUpTextLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
        ])
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 25),
            signUpButton.leadingAnchor.constraint(equalTo: singUpTextLable.trailingAnchor, constant: 10),
        ])
        view.addSubview(logWithoutRegistrButton)
        NSLayoutConstraint.activate([
            logWithoutRegistrButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 8),
            logWithoutRegistrButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
        ])
    }
}
