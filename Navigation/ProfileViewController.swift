//
//  ProfileViewController.swift
//  Navigation
//
//  Created by alisa on 03.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let subview = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView {
            self.view.addSubview(subview)
        }
    }
}
