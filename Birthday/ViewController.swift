//
//  ViewController.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 04/07/2024.
//

import UIKit
import CoreData

protocol ViewControllerDelegate:AnyObject {
    func addUserVC (user: Person )
}
class ViewController: UIViewController {
    
    
    
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bounces = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        constrain()

        view.backgroundColor = .systemGray6
        tableView.backgroundColor = .systemGray6
        tableView.register(tableViewCell.self, forCellReuseIdentifier: "tableViewCell")
let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //MARK:  the Button in the upper left corner
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddNewPersonView))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(test))
//        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(test))
//          let flexSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [/*editButton,*/searchButton, ]
      
    }
    @objc func test(){
        
    }
    
    @objc func AddNewPersonView(){
        let AddPersons = AddNewPerson()
        AddPersons.delegate = self
        navigationController?.pushViewController(AddPersons, animated: true)
    }
}
//MARK: Реализация протокола ViewControllerDelegate addUserVC
extension ViewController: ViewControllerDelegate{
    func addUserVC(user: Person) {
        persons.append(user)
        tableView.reloadData()
    }
}
//MARK: tableView Delegate DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
            
            let user = persons[indexPath.row]
        cell.nameLable.text = user.name  + " " + user.surname
        cell.phoneLable.text = user.phoneNumber
        cell.dateLable.text = user.dob
        cell.backgroundColor = .systemGray6
            return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAPCELL")
    }
}
extension ViewController {
    func constrain(){
        view.addSubview(tableView)
   NSLayoutConstraint.activate([
           tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
           tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
       ])
   }

}
