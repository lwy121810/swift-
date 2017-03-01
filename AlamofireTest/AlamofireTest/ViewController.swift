//
//  ViewController.swift
//  AlamofireTest
//
//  Created by liweiyou on 17/3/1.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let urlStr:URLConvertible = "http://httpbin.org/get"
//        Alamofire.request(urlStr).responseJSON { (DataResponse) in
//            
//        }
//        let method = HTTPMethod.get
//        
//        Alamofire.request(urlStr, method: method, parameters: nil).responseJSON { (DataResponse) in
//            print(DataResponse)
//        }
        
        
        
//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print("request -------- \(response.request)")  // original URL request
//            print("response -------- \(response.response)") // HTTP URL response
//            print("data -------- \(response.data)")     // server data
//            print("result -------- \(response.result)")   // result of response serialization
//            
//            print("current Thread ---- \(Thread.current)")
//            if let JSON = response.result.value {
//                print("--------- JSON: \(JSON)")
//            }
//        }
        
        WYNetworkTool.requestData(type: .GET, urlString: "https://httpbin.org/get") { (result) in
            
            print("--------- result: \(result)")
        }
        WYNetworkTool.requestData(type: .POST, urlString: "https://httpbin.org/post", parameters: ["name":"lwy"]) { (result) in
            
            print("post --------- result: \(result)")
        }
       
//
//        Alamofire.request("https://httpbin.org/get").response { response in
//            print("Request: \(response.request)")
//            print("Response: \(response.response)")
//            print("Error: \(response.error)")
//            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }
        //GET请求 带参数
//        let parameters: Parameters = ["foo": "bar"]
//        
//        // All three of these calls are equivalent
//        Alamofire.request("https://httpbin.org/get", parameters: parameters) // encoding defaults to `URLEncoding.default`
//        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding.default)
//        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding(destination: .methodDependent))

        
        // MARK:- POST请求 带参数
//        let parameters: Parameters = [
//            "foo": "bar",
//            "baz": ["a", 1],
//            "qux": [
//                "x": 1,
//                "y": 2,
//                "z": 3
//            ]
//        ]
//        
//        // All three of these calls are equivalent
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters)
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.default)
//        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)

        
        // MARK:- HTTP Header请求
//        let headers: HTTPHeaders = [
//            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//            "Accept": "application/json"
//        ]
//        
//        Alamofire.request("https://httpbin.org/headers", headers: headers).responseJSON { response in
//            debugPrint(response)
//        }
        
        // MARK:- 下载
//        Alamofire.download("https://httpbin.org/image/png").responseData { response in
//            if let data = response.result.value {
//                let image = UIImage(data: data)
//            }
//        }
        
        
        // MARK:- 自定义下载路径
//        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            
//            let filePath = documentsURL.appendingPathComponent("pig.png")
//            
//            return (filePath, [.removePreviousFile, .createIntermediateDirectories])
//        }
//        
//        Alamofire.download("", to: destination).response { response in
//            print(response)
//            
//            if response.error == nil, let imagePath = response.destinationURL?.path {
//                let image = UIImage(contentsOfFile: imagePath)
//            }
//        }
//        //或者
//        let destination = DownloadRequest.suggestedDownloadDestination(directory: .documentDirectory)
//        Alamofire.download("https://httpbin.org/image/png", to: destination)
        
        
        // MARK:- 下载进度
//        Alamofire.download("https://httpbin.org/image/png")
//            .downloadProgress { progress in
//                print("Download Progress: \(progress.fractionCompleted)")
//            }
//            .responseData { response in
//                if let data = response.result.value {
//                    let image = UIImage(data: data)
//                }
//        }
//        
//        
//        
//        
//        
//        let utilityQueue = DispatchQueue.global(qos: .utility)
//        
//        Alamofire.download("https://httpbin.org/image/png")
//            .downloadProgress(queue: utilityQueue) { progress in
//                print("Download Progress: \(progress.fractionCompleted)")
//            }
//            .responseData { response in
//                if let data = response.result.value {
//                    let image = UIImage(data: data)
//                }
//        }

        
        
        
        // MARK:- 上传
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

