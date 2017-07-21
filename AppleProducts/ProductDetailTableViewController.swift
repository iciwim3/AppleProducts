//
//  ProductDetailTableViewController.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/21/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var product: Product? = ProductLine.getProductLines()[0].products[1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        productDescriptionTextView.text = product?.description
        
    }

}
