
//  Model.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 10/07/2024.


import Foundation
import UIKit

struct PersonDTO: Encodable {
    var name: String
    var surname:String
    var phoneNumber: String
    //var email
    var age: String
    // var image: UIImage?
    
    init(name: String, surname: String, phoneNumber: String, age: String){//, image: UIImage?) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.age = age
        //self.image = image
    }
    
}
var persons: [PersonDTO] = []

//var user = Person(name: "", surname: "", phoneNumber: "", birthsday: <#String#>)





