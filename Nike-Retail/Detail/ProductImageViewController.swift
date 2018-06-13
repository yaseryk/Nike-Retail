//
//  ShoeImageViewController.swift
//  Nike-Retail
//
//  Created by Yaser on 12/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image : UIImage?{
        didSet{
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = image  
    }


}
