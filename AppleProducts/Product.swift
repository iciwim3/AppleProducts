//
//  Product.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/17/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//
// Product
// ProductLine will contain [Product]

import UIKit

enum ProductRating {
    case unrated
    case average
    case ok
    case good
    case brilliant
}

class Product {
    
    var image: UIImage
    var title: String
    var description: String
    var rating: ProductRating
    
    init(titled: String, description: String, imageName: String) {
        
        title = titled
        self.description = description
        if let image = UIImage(named: imageName) {
            self.image = image
        }
        else {
            self.image = UIImage(named: "default")!
        }
        
        rating = .unrated
        
    }
    
}

