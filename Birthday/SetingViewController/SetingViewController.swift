//
//  OneTestTabBar.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 10/08/2024.
//

import UIKit

class SetingViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = true
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        configurationNavBar()
        setConstraine()
    }
    private func configurationNavBar() {
        title = "Seting"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBlue
    }
}
extension SetingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
            
            return cell
        }
        
    }
extension SetingViewController {
    private func setConstraine() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
        ])
    }
}
    

