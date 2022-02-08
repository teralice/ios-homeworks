//
//  ProfileViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Профиль"
    }
}
