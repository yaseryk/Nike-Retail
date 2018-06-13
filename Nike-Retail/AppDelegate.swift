//
//  AppDelegate.swift
//  Nike-Retail
//
//  Created by Yaser on 10/06/2018.
//  Copyright © 2018 YaserYK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configureAppearance()
        
        return true
    }

    
    func configureAppearance(){
        UITabBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.black
    }

}

