//
//  ProfileViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileHeaderView: ProfileHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileHeaderView.backgroundColor = .lightGray
        self.navigationItem.title = "Профиль"
        self.view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = self.view.frame
    }
}
