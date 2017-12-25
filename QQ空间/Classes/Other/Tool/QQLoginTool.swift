//
//  QQLoginTool.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/23.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class QQLoginTool: NSObject {

    class func login(account: String, password:String, result:@escaping (_ isSuccess: Bool)->() ) {
        // 在后面某个时间点, 把任务,扔到对应的线程,排队
        // 参数1: 当前时间
        // 参数2: 延迟的时间(单位: 纳秒) (2 * (1s = n纳秒))
        // let time = DispatchTime.init(uptimeNanoseconds: 2 * NSEC_PER_SEC)

        let queue = DispatchQueue(label: "chase")
        queue.asyncAfter(deadline: .now() + 0.5) {
            print("asyncAfter")
            DispatchQueue.main.async {
                // 在本地进行判断, 以后, 如果修改, 直接在此处改成发送给服务器, 不需要改接口()
                if account == "wex" && password == "123" {
                    result(true)
                }else {
                    result(false)
                }
            }
        }
        
    }
    
}
