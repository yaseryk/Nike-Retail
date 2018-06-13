//
//  BuyButtonCell.swift
//  Nike-Retail
//
//  Created by Yaser on 11/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet weak var buyButtonLbl: UIButton!
    @IBAction func buyButtonPressed(_ sender: Any) {
    }
    
    var product : Product! {
        didSet{
            buyButtonLbl.setTitle("BUY $\(product.price! )", for: [])
        }
    }
    
}
