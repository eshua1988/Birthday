//
//  CoreDataTwst.swift
//  Birthday
//
//  Created by Olekssandr on 09/11/2024.
//

import UIKit.UIApplication
import CoreData


enum CoreDataError: Error {
    case error (String)
}

class CoreDataTest {
    static let instance = CoreDataTest()
    
    var usersy = [Usersy]()
    
    private init(){
        
        fetchAddUser()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Birthday")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchAddUser(){
        let reqest = Usersy.fetchRequest()
        if let users =  try? persistentContainer.viewContext.fetch(reqest){
            self.usersy = users
            
        }
    }
    func addNewUser (name:String, surname: String, phonNumber: Int16 ) {
        let user = Usersy(context: persistentContainer.viewContext)
        user.id = UUID().uuidString
        user.name = name
        user.surname = surname
        user.age = Date()
        user.phonNumber = phonNumber
        saveContext()
        fetchAddUser()
        
    }
}
//    func saveUser (name: String, surname: String, phoneNumber: String, age: String) -> Result<Void, CoreDataError> {
//        
//        // Ссылка на AppDelegate
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return .failure(.error("AppDelegate not found"))
//        }
//        
//        // Создаем контекст
//        let context = appDelegate.persistentContainer.viewContext
//        
//        // Описание Сущности
//        let entityDescription = NSEntityDescription.entity(forEntityName: "PersonDTO", in: context)
//        
//        // Создание Обьекта
//        let managedObject = NSManagedObject(entity: entityDescription!, insertInto: context)
//        
//        // Установка значение Отрибутов
//        managedObject.setValue(name, forKey: "name")
//        managedObject.setValue(surname, forKey: "surname")
//        managedObject.setValue(age, forKey: "age")
//        managedObject.setValue(phoneNumber, forKey: "phoneNumber")
//        
//        // Сохранение данных
//        do {
//            try context.save()
//        } catch {
//            return.failure(.error("Cloud not save. \(error)"))
//        }
//        return.success(())
//    }
//    
//    func getUser() -> Result<[PersonDTO], CoreDataError>{
//        
//        //Ссылка на Appdelegate
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return.failure(.error("AppDelegate not found"))
//        }
//        // Создаем Context
//        let context = appDelegate.persistentContainer.viewContext
//        
//        // Извлекаем Данные
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonDTO")
//        do {
//            let results = try context.fetch(fetchRequest)
//            guard let fechUsers = results as? [PersonDTO] else {
//                return.failure(.error("Could no cast as"))
//            }
////            for result in results {
////                print("name - \(result.value(forKey: "name")!), age - \(result.value(forKey: "age")!)")
//            //}
//            return .success(fechUsers)
//        } catch {
//            return .failure(.error("Could no fech\(error)"))
//        }
//    }

