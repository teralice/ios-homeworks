//
//  ViewModel.swift
//  Navigation
//
//  Created by alisa on 19.04.2022.
//

import UIKit

struct PostModel: ViewModelProtocol {
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
}
