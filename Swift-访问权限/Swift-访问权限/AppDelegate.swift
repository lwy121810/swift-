//
//  AppDelegate.swift
//  Swift-访问权限
//
//  Created by yons on 17/2/22.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = ViewController()
        vc.name = "lmj"
//        vc.age 因为age是private 所以不能访问
//        vc.height height是fileprivate 只有在ViewController.swift文件中能访问 所以在这访问不到， 在ViewController.swift文件中的Person类可以访问
        
        
        
        return true
    }


}

