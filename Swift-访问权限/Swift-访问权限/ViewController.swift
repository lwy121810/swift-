//
//  ViewController.swift
//  Swift-访问权限
//
//  Created by yons on 17/2/22.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

// MARK:- 权限
/*
 1> internal:内部的
    1. 默认情况下所有的类&属性&方法的访问的权限都是internal
    2. 在本模块(项目、包、target)中可以访问
 2> private:私有的
    1. 只有在本类中可以访问
 3> open: 公开的
    1. 可以跨模块(项目、包、target)访问
 4> fileprivate: Swift3.0
    1. 只要是在本文件中都是可以访问的
 */

class ViewController: UIViewController {

    // 默认是internal权限 在本项目、包、target可以访问
    var name = ""
    // 只有在本类中访问
    private var age = 0
    //只有在本文件可以访问
    fileprivate var height = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //访问name
        name = "lwy"
        print(name)
        //访问age
        age = 18
        print(age)
        //访问height
        height = 1.88
        print(height)
    }

}

class Person: NSObject {
    func test () {
        let vc = ViewController()
        vc.name = "lisi"
//        vc.age 不能访问age 因为age是private 只有在ViewController类中能访问
        vc.height = 50.0 //height是fileprivate 在本文件中可以访问 但是在appdelegate中就不能访问了
    }
}





