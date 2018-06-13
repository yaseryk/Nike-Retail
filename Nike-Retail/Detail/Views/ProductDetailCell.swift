//
//  ProductDetailCell.swift
//  Nike-Retail
//
//  Created by Yaser on 11/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet weak var productDetailLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    
    var product : Product? {
        didSet{
            if let product = product{
                productDetailLbl.text = product.description
                productNameLbl.text = product.name
            }
            
        }
    }
}
