//
//  PostViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var itemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = FeedViewController.post.title
        self.itemButton.image = UIImage(systemName: "exclamationmark.circle")
    }
}
