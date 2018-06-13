//
//  ProductImagesPageViewController.swift
//  Nike-Retail
//
//  Created by Yaser on 12/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

protocol ProductImagesPageViewControllerDelegate : class {
    func setupPageController(numberOfPages : Int)
    func turnPageController(to index : Int)
}

class ProductImagesPageViewController: UIPageViewController {
 
    var images : [UIImage]? = Product.fetchProducts().first?.images
    
    
    weak var pageViewControllerDelegate : ProductImagesPageViewControllerDelegate?
    
    struct Storyboard {
        static let productImageViewController = "ProductImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let shoeImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.productImageViewController)
                controllers.append(shoeImageVC)
            }
        }
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        
        dataSource = self
        delegate = self
        
        self.turnToPage(index : 0)
        
    }
    
    func turnToPage(index: Int){
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController){
        for (index, vc) in controllers.enumerated() {
            if viewController === vc {
                if let productImageVC = viewController as? ProductImageViewController {
                    productImageVC.image = self.images?[index]

                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }
    
}

// MARK:- PageViewController DataSource

extension ProductImagesPageViewController : UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}

// MARK:- PageViewController Delegate

extension ProductImagesPageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.configureDisplaying(viewController: pendingViewControllers.first as! ProductImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! ProductImageViewController)
        }
    }
}





