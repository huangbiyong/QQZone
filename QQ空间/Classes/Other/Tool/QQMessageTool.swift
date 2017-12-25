//
//  QQMessageTool.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/23.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class QQMessageTool: NSObject {

    class func showMessage(messageStr: String, toVC: UIViewController) {
        // 提示框
        if #available(iOS 8.0, *) {
            let alertVC = UIAlertController(title: "友情提示", message: messageStr, preferredStyle: UIAlertControllerStyle.alert)
            
            // 添加关闭的行为
            let action = UIAlertAction(title: "关闭", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) in
                toVC.dismiss(animated: false, completion: nil)
            })
            alertVC.addAction(action)
            
            toVC.present(alertVC, animated: true, completion: nil)
        } else {
            
            let alertView = UIAlertView(title: "友情提示", message: "用户名或者密码错误", delegate: nil, cancelButtonTitle: "关闭")
            // 等待关闭
            alertView.show()
            
        }
    }
    
}
