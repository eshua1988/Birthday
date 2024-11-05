//
//  Model.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 10/07/2024.
//

import Foundation
import SwiftUI

struct Person {
    var name: String
    var surname:String
    var phoneNumber: String
    //var email
    var dob: String
    // var image: UIImage?
    
    init(name: String, surname: String, phoneNumber: String, birthsday: String){//, image: UIImage?) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.dob = birthsday
        //self.image = image
    }
    
}
var persons: [Person] = []

//var user = Person(name: "", surname: "", phoneNumber: "")





