//
//  ViewController.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 04/07/2024.
//

import UIKit
import CoreData
import FSCalendar

protocol ViewControllerDelegate:AnyObject {
    func addUserVC (user: PersonDTO )
}
class ViewController: UIViewController {
    var usery = [PersonDTO]() {
        didSet {
            tableView.reloadData()
        }
    }
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private var calendarHaighConstrain: NSLayoutConstraint!
    var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    let showHideButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open calendar", for: .normal)
        button.setTitleColor( .gray , for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)

       return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = .week
        
        

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(tableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        configurationNavBar()
        constrain()
        
        //MARK: button open/clouse the calendar
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    @objc private func showHideButtonTapped(){
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close calendar", for: .normal)
        }else{
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open calendar", for: .normal)
        }
    }
    private func configurationNavBar() {
        title = "Contact"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBlue
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //MARK:  the Button in the upper left corner / кнопка в левом верхнем углу
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddNewPersonView))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(test))
        //        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(test))
        //          let flexSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [/*editButton,*/searchButton, ]
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // loadUsers()
    }
    @objc func test() {
        
    }
    
    @objc func AddNewPersonView(){
        let AddPersons = AddNewPerson()
        AddPersons.delegate = self
        navigationController?.pushViewController(AddPersons, animated: true)
    }
//    private func loadUsers() {
//        let operationResult = CoreDataTest.instance.getUser()
//        
//        switch operationResult {
//        case .success(let users):
//            self.usery = users
//        case .failure(let failure):
//            print(failure)
//        }
//    }
}
//MARK: Реализация протокола ViewControllerDelegate addUserVC
extension ViewController: ViewControllerDelegate{
    func addUserVC(user: PersonDTO) {
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
        cell.dateLable.text = user.age
       
        cell.backgroundColor = .systemGray6
            return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAPCELL")
        
        let cell = tableView.cellForRow(at: indexPath)as! tableViewCell
        switch indexPath.section {
        case 6: alertPhotoCamera { [self] source in
            chooseImagePicker(source: source)
        }
        default:
            print("Tap ContactTableView")
        }
    }
}
//MARK: Calendar delegation ((FSCalendar) FSCalendarDelegate ,FSCalendarDataSource)
extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHaighConstrain.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}
// MARK: implementation UIImagePickerControllerDelegate (реализация UIImagePickerControllerDelegate)

extension ViewController: UIImagePickerControllerDelegate, UINavigationBarDelegate {
    func chooseImagePicker (source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            //imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
extension ViewController {
    func constrain() {
        calendarHaighConstrain = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHaighConstrain)
        
        view.addSubview(calendar)
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        view.addSubview(showHideButton)
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0 ),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showHideButton.widthAnchor.constraint(equalToConstant: 100),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
         ])
        view.addSubview(tableView)
   NSLayoutConstraint.activate([
    tableView.topAnchor.constraint(equalTo: showHideButton.bottomAnchor, constant: 10),
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
           tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
       ])
   }
}
