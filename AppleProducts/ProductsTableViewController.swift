//
//  ProductsTableViewController.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/17/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

// 1 - Design the new cell in Storyboard
// 2 - Create a subclass of UITableViewCell for the new cell
// 3 - Update cell with UITableViewDataSource

import UIKit

class ProductsTableViewController: UITableViewController {

    // MARK: - Data model
    
    var products = ProductLine.getProductLines()[1].products
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Apple Store at Westheimer"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductTableViewCell
        
        let product = products[indexPath.row]
        
        cell.product = product
        
        return cell
    }
    
}
