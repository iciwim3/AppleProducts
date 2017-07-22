//
//  ProductsTableViewController.swift
//  AppleProducts
//
//  Created by Sain-R Edwards Jr. on 7/17/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

// * Custom Table View Cell

// 1. Design the new cell in Storyboard
// 2. Create a subclass of UITableViewCell for the new cell
// 3. Update cell with UITableViewDataSource

// * Delete Rows
// 1. Edit button on the right
// 2. Delete a row (in our data model & in our tableview -- UI)
// 3. Nice animagion - move the table view rows up

// --

// * Move rows around table view
// 1. Tell the table view that you want to be able to move rows around
// 2. Update the data model & update the table view UI

import UIKit

class ProductsTableViewController: UITableViewController {

    // MARK: - Data model
    
    var productLines: [ProductLine] = ProductLine.getProductLines()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Apple Store at Westheimer"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = editButtonItem
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductTableViewCell
        let productLine = productLines[indexPath.section]
        let products = productLine.products
        let product = products[indexPath.row]
        
        cell.product = product
        
        return cell
    }
    
    // Multiple Sections
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let productLine = productLines[section]
        
        return productLine.name
        
    }
    
    // Delete Rows
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 1 - Delete the product from the products of the productLine's [products]
            
            let productLine = productLines[indexPath.section]
            productLine.products.remove(at: indexPath.row)
            
            // 2 - Update the table view with the new data
            
            // tableView.reloadData() // Not the best way of reloading the table view
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    // Moving Cells
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
       
        return true
        
    }
    
    // Update the tableview and UI
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        // Move productToMove to destination products
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        
        // Delete the productToMove from the source products
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
        
    }
    
    // MARK: - UITableViewDelegate
    
    var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        selectedProduct = product
        
        performSegue(withIdentifier: "ShowProductDetail", sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProductDetail" {
            let productDetailTVC = segue.destination as! ProductDetailTableViewController
            productDetailTVC.product = selectedProduct
        }
    }
    
}
