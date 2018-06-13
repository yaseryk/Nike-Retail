//
//  ProductImagesHeaderViewController.swift
//  Nike-Retail
//
//  Created by Yaser on 12/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView {

    @IBOutlet weak var pageControl : UIPageControl!

}
extension ProductImagesHeaderView : ProductImagesPageViewControllerDelegate {
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
    
    
}
