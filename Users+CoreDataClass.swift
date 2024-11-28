//
//  Users+CoreDataClass.swift
//  Birthday
//
//  Created by Olekssandr on 06/11/2024.
//
//

import Foundation
import CoreData

@objc(Users)
public class Users: NSManagedObject {

    var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "SavingLearn")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
}
