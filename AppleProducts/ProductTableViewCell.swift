//
//  ProductTableViewCell.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/18/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    // MARK: - Data Model
    
    var product: Product? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        productImageView.image = product?.image
        productTitleLabel.text = product?.title
        productDescription.text = product?.description
    }
    
    
    
    
    

}
