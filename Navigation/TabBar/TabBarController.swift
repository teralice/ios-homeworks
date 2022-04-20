//
//  TabBarController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .systemBackground
           setupTabBar()
           setupViewControllers()
       }

       func setupTabBar(){
           UITabBar.appearance().clipsToBounds = true
           UITabBar.appearance().barTintColor = .systemBackground
       }
       
       func setupViewControllers() {
           viewControllers = [
               createNavController(for: FeedViewController(), title: NSLocalizedString("Feed", comment: ""), image: UIImage(systemName: "house.fill")!),
               createNavController(for: LogInViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.fill")!)
           ]
       }
       
       fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = false

           return navController
       }
}
