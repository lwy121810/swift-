//
//  AppDelegate.swift
//  Swift-tableView的使用
//
//  Created by yons on 17/2/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

/**
 自定义log的目的是在debug模式下打印信息 在release环境下不打印 swift没有宏定义
 
 */

// MARK:- 自定义log
// 这是一个全局函数 在任何文件都能够直接使用
func WYLog<T>(message:T, fileName:String = #file, funcName : String = #function, lineNum : Int = #line)  {
    /*
     获取打印所在文件 #file获取的全路径
     let file = (#file as NSString).lastPathComponent
     获取打印所在的方法
     let funcName = #function
     
     获取所在行
     let lineNum = #line
     
     WYLog(message: 123)
     
     */
    #if WYDEBUG
    let filePath = (fileName as NSString).lastPathComponent
    
    //print("\(filePath):\(funcName):\(lineNum)-\(message)")
    print("文件:\(filePath) 行:\(lineNum) log:\(message)")//我们已经打印了行数，所以就不用打印方法名了
    #endif
}
