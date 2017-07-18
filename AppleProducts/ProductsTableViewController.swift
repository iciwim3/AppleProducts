//
//  ProductsTableViewController.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/17/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    // MARK: - Data model
    
    var products = ProductLine.getProductLines()[1].products
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Apple Store at Westheimer"
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.title
        
        return cell
    }
    
}
