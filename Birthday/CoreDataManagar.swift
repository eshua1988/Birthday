//
//
//
//
//import CoreData
//import UIKit.UIApplication
//
//enum CoreDataError: Error {
//        case error(String)
//    }
//final class CoreDataManagar {
//    static let instance = CoreDataManagar()
//    private init (){}
//
//    
//    func saveUser (users: Usersy )-> Result<Void, CoreDataError> {
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return  .failure(.error("AppDelegate not found"))
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Usersy", in: managedContext)!
//
//        let user = NSManagedObject(entity: entity, insertInto: managedContext)
//        
////        user.setValue(users.name, forKey: "name")
////        user.setValue(users.surname, forKey: "surname")
////        user.setValue(users.phoneNumber, forKey: "phoneNumber")
////        user.setValue(users.age, forKey: "age")
//        do{
//            try managedContext.save()
//        }catch{
//            return.failure(.error("Could not save. \(error)"))
//        }
//        return .success(())
//    }
//    
//    func getUsers ( )-> Result<[Usersy], CoreDataError>{
//
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return  .failure(.error("AppDelegate not found"))
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Usersy")
//        do{
//            let objects = try managedContext.fetch(fetchRequest)
//            guard let fetchUsers = objects as? [Usersy] else {
//                return .failure(.error("Could not cast as [PersonDTO]"))
//            }
//        
//            return .success(fetchUsers)
//        } catch {
//            return .failure(.error("Could no fech\(error)"))
//        }
//    }
//    
//    func getUser(by surname: String) -> Result<Usersy, CoreDataError> {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return  .failure(.error("AppDelegate not found"))
//        }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Usersy")
//        let predicate = NSPredicate(format: "surname == %@", surname)
//        
//        fetchRequest.predicate = predicate
//        fetchRequest.fetchLimit = 1
//        do{
//            let objects = try managedContext.fetch(fetchRequest)
//            guard let fetchUsers = objects as? [Usersy] else {
//                return .failure(.error("Could not cast as [Usersy]"))
//            }
//            if let user = fetchUsers.first{
//                return .success(user)
//            } else {
//                return .failure(.error("Usersy not fount"))
//            }
//        } catch {
//            return .failure(.error("Could no fetch\(error)"))
//        }
//        return .failure(.error("Error."))
//       // managedContext.delete(users)
//    }
//}
