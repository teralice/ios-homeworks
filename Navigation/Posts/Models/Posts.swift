//
//  Post.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

struct Posts: Decodable {
    
    struct Post: Decodable {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
        
        var imageUI: UIImage {
            return UIImage(named: self.image)!
        }
        
        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }
    
    let posts: [Post]
}
