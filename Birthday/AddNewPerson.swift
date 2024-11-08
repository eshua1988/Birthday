//
//  AddNewPerson.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 07/07/2024.
//

import UIKit
import Foundation

class AddNewPerson: UIViewController {
    
    weak var delegate : ViewControllerDelegate?
    
    var dateBirthday = NSDate()
    
    let datePicker: UIDatePicker = {
        let date = UIDatePicker()
        if #available(iOS 13.4, *) {
            date.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        date.datePickerMode = .date
        // Language datePisker - не работает
        let localeID = Locale.preferredLanguages.first
        date.locale = Locale(identifier: "localeID")
        // date.translatesAut oresizingMaskIntoConstraints = false
        return date
    }()
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.layer.cornerRadius = 10
        nameTextField.backgroundColor = .systemGray6
        nameTextField.textAlignment = .center
        nameTextField.placeholder = "Name person"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    let surnameTextField: UITextField = {
        let surnameTextField = UITextField()
        surnameTextField.layer.cornerRadius = 10
        surnameTextField.backgroundColor = .systemGray6
        surnameTextField.textAlignment = .center
        surnameTextField.placeholder = "Surname person"
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        return surnameTextField
    }()
    let phoneTextField: UITextField = {
        let phoneTextField = UITextField()
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.backgroundColor = .systemGray6
        phoneTextField.placeholder = "Phone person"
        phoneTextField.textAlignment = .center
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        return phoneTextField
    }()
    let dateTextField: UITextField = {
        let datePicer = UITextField()
        datePicer.layer.cornerRadius = 10
        datePicer.backgroundColor = .systemGray6
        datePicer.placeholder = "Date person"
        datePicer.textAlignment = .center
        datePicer.translatesAutoresizingMaskIntoConstraints = false
        return datePicer
    }()
    var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.backgroundColor = .blue
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        return saveButton
    }()
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill.badge.plus")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemGray6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        dateTextField.inputView = datePicker
        setConstrain()
        view.backgroundColor = .white
        
        // Button for add people in table
        saveButton.addTarget(self, action: #selector(saveTapedButton), for: .touchUpInside)
        
        //Button on date Picer
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closedAction))
        // the location of the button on the right side == .flexibleSpace
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton,flexSpace,doneButton], animated: true)
        dateTextField.inputAccessoryView = toolBar
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        //  tap / touch gesture to hide the datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doneButtonAction))
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func closedAction(){
        dateTextField.text = ""
        view.endEditing(true)
    }
    @objc func doneButtonAction(){
        view.endEditing(true)
    }
    @objc func dateChange(datePicker: UIDatePicker){
        dateTextField.text = getDateFromPicker(date: datePicker.date)
    }
    func getDateFromPicker(date: Date) -> String {
        let formatted = DateFormatter()
        formatted.dateFormat = "dd.MM.yyyy"
        
        dateTextField.text = formatted.string(from: datePicker.date)  //<------?????
        return formatted.string(from: date)   //<------????
    }
    @objc func saveTapedButton(){
        
        
        let namePerson = nameTextField.text
        if  namePerson != nil {
            nameTextField.text = textInputContextIdentifier
        }else{ nameTextField.text = ""
        }
        let surnamePerson = surnameTextField.text
        if  surnamePerson != nil {
            surnameTextField.text = textInputContextIdentifier
        }else{
        }
        let phoneNumperPerson = phoneTextField.text
        if  phoneNumperPerson != nil {
            phoneTextField.text = textInputContextIdentifier
        }else{
        }
        var dobPerson = dateTextField.text
        if  dobPerson != nil {
            dobPerson = getDateFromPicker(date: datePicker.date)
        }else{ dateTextField.text = ""
        }
        //        guard let namePerson = nameTextField.text , !namePerson.isEmpty  else {return}
        //        nameTextField.text = ""
        //        guard let surnamePerson = surnameTextField.text, !surnamePerson.isEmpty  else {return}
        //        surnameTextField.text = ""
        //        guard let phoneNumperPerson = phoneTextField.text, !phoneNumperPerson.isEmpty  else {return}
        //        phoneTextField.text = ""
        //        guard var dateBirthdayPerson = datePicerTextField.text, !dateBirthdayPerson.isEmpty  else {return}
        //        dateBirthdayPerson = getDateFromPicker(date: datePicker.date)
        //        datePicerTextField.text = ""
        
        self.delegate?.addUserVC(user: Person(name: namePerson ?? "" , surname: surnamePerson!, phoneNumber: phoneNumperPerson ?? "", birthsday: dobPerson!))//, image: UIImage?))
        // Возвращаемся на предыдущий экран
        navigationController?.popViewController(animated: true)
    }
    
}
extension  AddNewPerson {
    func setConstrain(){
       
        
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        view.addSubview(surnameTextField)
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(phoneTextField)
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40),

        ])
        view.addSubview(dateTextField)
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            dateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.dateTextField.bottomAnchor, constant: 20),
           // imageView.bottomAnchor.constraint(equalTo: self.saveButton.topAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

