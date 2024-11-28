//
//  AddBirthdayViewController.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 02/08/2024.
//

import UIKit

class ContactViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationNavBar()
        constrain()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    private func configurationNavBar () {
        title = "Birthday Calendar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBlue
    }
}
extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
        
        
        return cell
    }
}
extension ContactViewController {
    func constrain(){
        view.addSubview(tableView)
   NSLayoutConstraint.activate([
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0)
       ])
   }
}
