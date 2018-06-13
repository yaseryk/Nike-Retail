//
//  ProductDetailTVController.swift
//  Nike-Retail
//
//  Created by Yaser on 11/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class ProductDetailTVController: UITableViewController {
    @IBOutlet weak var productImageHeaderView : ProductImagesHeaderView!
  
    var product : Product!
  
    
    struct Storyboard {
        static let productDetailCell = "ProductDetailCell"
        static let showImagesPageVC = " ShowImageHeaderViewController"
        static let buyButtonCell = "BuyButtonCell"
        static let ShowProductDetailCell = "ShowProductDetailCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }

    func viewSetup(){
        title = product.name

        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC{
            if let imagePageVC = segue.destination as? ProductImagesPageViewController {
                imagePageVC.images = product.images
                imagePageVC.pageViewControllerDelegate = productImageHeaderView
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            //cell.product = product
            cell.selectionStyle = .none
            
            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ShowProductDetailCell, for: indexPath)
            cell.selectionStyle = .none
            
         return cell
        }
        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//          return cell
            return UITableViewCell()
        }
 

    }
    
}
