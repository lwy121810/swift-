//
//  ViewController.swift
//  Swift-tableView的使用
//
//  Created by yons on 17/2/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    /** 注释
     Swift中添加文档注释较为简单
     使用(///)可以为方法或者属性添加文档注释
     
     swift中不可以再使用 #pragma mark -
     如果打算对代码进行分组可以使用 // MARK:-方式
     
     */
    
    // MARK:- 懒加载
    /// tableView的属性
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 当前对象调用方法 可以不加self
        setupUI()
        
        //使用自定义的log来打印
        WYLog(message: 123)
    }
}





// MARK:- 设置UI
extension ViewController {
    /// 设置UI
    func setupUI() {
        //1.添加tableView到view
        view.addSubview(tableView)
        
        //2.设置tableView的frame
        tableView.frame = view.bounds
        
        //3.设置数据源
        tableView.dataSource = self
        
        //4.设置代理
        tableView.delegate = self
    }
}
// MARK:- 设置数据源和代理
// extension相当于OC中category，也是只能扩充方法 不能扩充属性
extension ViewController: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        // 这个cell是可选类型 因为通过一个ID可能取出来cell 也可能取不出来，取不出来的时候返回nil，取出来的时候返回一个cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) //这里不能用let来修饰 因为如果取不出来数据的时候会返回nil，nil的地址为0x0， 但是通过下面的方法来创建一个cell并赋值给变量cell的时候，cell的地址会改变，所以不能用let
        
        if cell == nil {
            //枚举类型的使用方法： 1.枚举类型.具体的类型  2. 直接就是 .具体的类型
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // 给cell设置数据
        // ?的作用可以联系上次学的 ？会先对前面的可选类型进行判断，如果可选类型没有值，则就不会执行后面的代码 如果有值 系统会自动解包
        cell?.textLabel?.text = "测试数据\(indexPath.row)"
        
        // 这里直接retrun cell的话会报错 因为我们返回的数据类型应该是UITableViewCell类型 这里的cell是可选类型 所以要对cell进行强制解包 这里的cell一定会有值，所以可以进行强制解包
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }
}

