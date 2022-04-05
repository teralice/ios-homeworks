//
//  TabBarController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

//class TabBarController: UITabBarController {
//
//    private enum Index: Int {
//        case none = 0
//        case first
//        case second
//
//        var title: String? {
//            switch self {
//            case .none:
//                return nil
//            case .first:
//                return "Лента"
//            case .second:
//                return "Профиль"
//            }
//        }
//
//        var image: UIImage? {
//            switch self {
//            case .none:
//                return nil
//            case .first:
//                return UIImage(systemName: "house")
//            case .second:
//                return UIImage(systemName: "person")
//            }
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.viewControllers?.enumerated().forEach({ (index, viewController) in
//            switch index {
//            case 0:
//                viewController.tabBarItem.image = Index.first.image
//                viewController.tabBarItem.title = Index.first.title
//            case 1:
//                viewController.tabBarItem.image = Index.second.image
//                viewController.tabBarItem.title = Index.second.title
//            default:
//                viewController.tabBarItem.title = Index.none.title
//            }
//        })
//    }
//}

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .blue
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            createNavigationController(for: FeedViewController(), title: NSLocalizedString("Лента", comment: ""), image: UIImage(systemName: "house")!),
            createNavigationController(for: LogInViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }

    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }
}
