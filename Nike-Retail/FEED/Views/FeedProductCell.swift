//
//  FeedProductCell.swift
//  Nike-Retail
//
//  Created by Yaser on 11/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class FeedProductCell: UITableViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    
    var product : Product?{
        didSet{
            self.updateUI()
        }
    }
    func updateUI(){
        if let product = product{
            productImg.image = product.images?.first
            productNameLbl.text = product.name
            if let productPrice = product.price{
                productPriceLbl.text = "\(productPrice)"
            }
            else{
                productPriceLbl.text = ""
            }
            
            
        }
    }
}

