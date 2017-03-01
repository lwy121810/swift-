//
//  ViewController.swift
//  Swift-闭包
//
//  Created by yons on 17/2/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

/**闭包的介绍
 
 闭包和OC中的block非常相似
 OC中的block是匿名的函数
 Swift中的闭包是一个特殊的函数
 block和闭包都经常用于回调
 注意:闭包和block一样,第一次使用时可能不习惯它的语法,可以先按照使用简单的闭包,随着学习的深入,慢慢掌握其灵活的运用方法.
 
 闭包写法总结:
 闭包的写法:
 类型:(形参列表)->(返回值)
 技巧:初学者定义闭包类型,直接写()->().再填充参数和返回值
 值:
 {
 (形参) -> 返回值类型 in
 // 执行代码
 }
 */

class ViewController: UIViewController {
    /*懒加载
     swift中也有懒加载的方式
     (苹果的设计思想:希望所有的对象在使用时才真正加载到内存中)
     和OC不同的是swift有专门的关键字来实现懒加载
     lazy关键字可以用于定义某一个属性懒加载
     
     
     */
    // 懒加载的格式 lazy var 变量: 类型 ＝ { 创建变量代码 }()
    // 懒加载的本质是,在第一次使用的时候执行闭包,将闭包的返回值赋值给属性
    // lazy的作用是只会赋值一次
    lazy var names : [String] = {
       () -> [String] in
        return ["lwy","zhangsan"]
    }()
    
    // 使用类时不需要倒入类， 默认自己创建的类在同一命名空间中
    var tool : HttpTool = HttpTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    func requestData (callBack : (_ json : String) -> (Int)) {
//        
//        callBack("23")
//    }
    
    func requestData(callBack : (_ json : String) -> ()) {
        
        callBack("12")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(names)
        tool.loadData { (callBack) in
            
        }
        
        requestData { (json) in
            weak var weakSelf = self
            tool.requestData(callBack: { (json) in
                weakSelf?.view.backgroundColor = UIColor.red
            })
        }
        
        requestData { [weak self](json) in
            
        }
        
//        tool.loadData { (callBack) in
//            self.view.backgroundColor = UIColor.red//这里使用self并没有造成循环引用 因为这里控制器对tool有强引用， 闭包对self有强引用，但是tool对闭包没有强引用 所以可以用self 在deinit方法中可以看到有打印
//            print("\(callBack)")
//        }
        
        // 如果造成了循环引用 可以这么解决
        /*
        weak var weakSelf = self //这里必须写成var let的话表示等号后面的self不能修改，但是self保存的内存地址有可能改变，所以weakSelf保存的内存地址也可能发生改变，用let的话是不能改变的，但是又又可能会改变，所以用var来修饰
        tool.loadData { (jsonData) in
//            weakSelf.view.backgroundColor = UIColor.red 这样会报错 因为可以查看weakSelf的类型是 ViewController?类型，是一个可选类型，因为self存放的地址有可能会改变，有可能保存0x110地址，也有可能保存0x0地址，0x0是nil的地址，所以self有可能有值，也有可能为空，所以是一个可选类型 所以要写成下面
            
            /*weakSelf?.view
             这里可选类型用?而不是前面学的用! 是因为
             1.如果前面的可选类型没有值， ? 后面的代码都不会被执行
             2.如果前面的可选类型有值，系统会自动对weakSelf进行解包，并且使用weakSelf
             */
            // 解决循环引用的方法一
            weakSelf?.view.backgroundColor = UIColor.red//
            
         weakSelf!.view.backgroundColor = UIColor.red//也可以这么写 直接强制解包 (该处强制解包没有问题,因为控制器一定存在,否则无法调用所在函数)
        }
 */
        
        
        
        //解决循环引用的方法二 ：推荐使用
        
        //跟方法一的含义是一样的，这只是一个更简便的写法,只是上一种方法的简化
        //在闭包的第一个大括号后面写一个[],这是一种固定格式，这种格式是对上面方法的一种简化，直接在[]里写weak  self
        tool.loadData {[weak self] (jsonData) in
            self?.view.backgroundColor = UIColor.red//这里的self其实是使用的[weak self]中的临时变量self 是一个可选类型
        }
 
        //方法三
        /*
        unowned相当于OC中的 __unsafe_unretained
         __weak和__unsafe_unretained的区别:
         __weak修饰的弱引用，如果指向的对象销毁，那么指针会立马指向nil(0x0)
         __unsafe_unretained修饰的弱引用，如果指向的对象销毁，那么指针依然会指向之前的内存地址，很容易产生"野指针"／‘僵尸对象’
         */
        //使用unowned的前提是self没有被销毁
        tool.loadData {[unowned self] (jsonData) in
            self.view.backgroundColor = UIColor.red
        }
        
        //尾随闭包
        //如果闭包作为方法的最后一个参数，那么闭包可以将()省略掉
        tool.loadData {[weak self] (jsonData) in
            self?.view.backgroundColor = UIColor.red
        }
        tool.loadData() {[weak self] (jsonData) in
            self?.view.backgroundColor = UIColor.red
        }
        
       
    }
    
    
    
    //相当于OC中的dealloc方法 当对象销毁时会调用该函数
    deinit {
        
        print("ViewController deinit ---- ")
    }
    
    
}

