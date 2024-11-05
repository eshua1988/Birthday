//
//  MainTabBar.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 02/08/2024.
//

import UIKit

final class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        
       // setupTabBar()
        generateTabBar()
        //setTabBarApperence()
        
    }
    private func generateTabBar(){
        let viewController = generateVC(vc: ViewController(), itemName: "View1", itemImage: "calendar.badge.clock")
        let addBirthdayViewController = generateVC(vc: AddBirthdayViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        let setingVC = generateVC(vc: SetingViewController(), itemName: "Seting", itemImage: "gearshape.fill")
        viewControllers = [viewController, addBirthdayViewController,setingVC]
    }
     func generateVC(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
         
                 let positionOnX: CGFloat = 10
                 let positionOnY: CGFloat = 14
                 let width = tabBar.bounds.width - positionOnX * 2
                 let height = tabBar.bounds.height + positionOnY * 2
         
                 let roundLayer = CAShapeLayer()
                 let BezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: 28)
         
                 roundLayer.path = BezierPath.cgPath
         
                 tabBar.layer.insertSublayer(roundLayer, at: 0)
                 tabBar.itemWidth = width / 5
                 tabBar.itemPositioning = .centered
                 // настройка цвета TabBarItem
                 roundLayer.fillColor = UIColor.mainWhite.cgColor // настройка tabBar.backgraundColor
                 tabBar.tintColor = .tabBarItemAccent
                 tabBar.unselectedItemTintColor = .tabBarItemLight
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        return navController
    }
    
//    func setupTabBar(){
//        let scheduleViewController = createNavController(vc: ViewController(), itemName: "Schedule", itemImage: "calendar.badge.clock")
//        let tasksViewController = createNavController(vc: AddBirthdayViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")
//        let contactsViewController = createNavController(vc: OneTestTabBar(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")
//        viewControllers = [scheduleViewController, tasksViewController,contactsViewController ]
//    }
//    func createNavController(vc: UIViewController, itemName: String, itemImage: String)-> UINavigationController{
//        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)/*?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))*/, tag: 0 )
//        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
//        let navController = UINavigationController(rootViewController: vc)
//      //  navController.tabBarItem = item
//        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
//        return navController
    //}
    
//    // закругление Tab Bara и замеа цвета
//    func setTabBarApperence(){
//        let positionOnX: CGFloat = 10
//        let positionOnY: CGFloat = 14
//        let width = tabBar.bounds.width - positionOnX * 2
//        let height = tabBar.bounds.height + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//        let BezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: 28)
//        
//        roundLayer.path = BezierPath.cgPath
//        
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
//        // настройка цвета TabBarItem
//        roundLayer.fillColor = UIColor.mainWhite.cgColor // настройка tabBar.backgraundColor
//        tabBar.tintColor = .tabBarItemAccent
//        tabBar.unselectedItemTintColor = .tabBarItemLight
   // }

}

