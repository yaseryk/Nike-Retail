//
//  FeedTVC.swift
//  Nike-Retail
//
//  Created by Yaser on 11/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class FeedTVC: UITableViewController {

    var products : [Product]?
    
    struct Storyboard {
    static let feedProductCell  =  "FeedProductCell"
    static let showProductDetail =  "ShowProductDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        fetchProduct()
    }

    func fetchProduct(){
        products = Product.fetchProducts()
        tableView.reloadData()
    }
    
    func setupAppearance(){
        navigationItem.title = "FEED"
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
//MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showProductDetail{
            if let productDetailVC = segue.destination as? ProductDetailTVController{
                let selectedProduct = self.products?[(sender as! IndexPath).row]
                productDetailVC.product = selectedProduct
            }
        }
    }
    
//MARK: - Table view DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products{
            return products.count
        }
        else{
             return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.feedProductCell , for: indexPath) as! FeedProductCell
        
        if let product = products{
            cell.product = product[indexPath.row]
            cell.selectionStyle = .none
        }
        return cell
    }
  
// MARK: - Table view deleagate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: indexPath)
    }

}
