//
//  QQLoginVC.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/23.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class QQLoginVC: UIViewController {

    @IBOutlet weak var remenberPwdBtn: UIButton!
    @IBOutlet weak var autoLoginBtn: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func remenberPwdClick(_ sender: UIButton) {
        
        remenberPwdBtn.isSelected = !remenberPwdBtn.isSelected
        if remenberPwdBtn.isSelected == false {
            autoLoginBtn.isSelected = false
        }
    }
    
    @IBAction func autoLoginClcik(_ sender: UIButton) {
        autoLoginBtn.isSelected = !autoLoginBtn.isSelected
        
        if autoLoginBtn.isSelected == true {
            remenberPwdBtn.isSelected = true
        }
        
    }
    
    @IBAction func loginClick(_ sender: Any) {
        // 获取用户名, 和密码
        let account = accountTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        // 登录之前做的处理
        prelogin()
        // 发送给服务器, 验证身份
        QQLoginTool.login(account: account, password: password) { (isSuceess) in
            // 返回给我们结果, 做不同处理
            
            if isSuceess {
                print("成功")
                // 跳转界面
                let homeVC = QQHomeVC()
                UIApplication.shared.keyWindow?.rootViewController = homeVC

            }else {
                print("用户名,或者密码错误")
                // 错误动画
                self.loginErro()
                
                // 提示信息
                QQMessageTool.showMessage(messageStr: "用户名或者密码错误", toVC: self)
            }
            
            // 登录完成之后做的处理
            self.endLogin()
        }
    }
    
    func prelogin() -> () {
        
        // 1. 禁止用户交互
        view.isUserInteractionEnabled = false
        
        // 2. 转圈动画开始
        loadingActivity.startAnimating()
    }
    
    func endLogin() -> () {
        
        // 1. 开启用户交互
        view.isUserInteractionEnabled = true
        
        // 2. 转圈动画停止
        loadingActivity.stopAnimating()
    }
    
    
    func loginErro() -> () {
        // 抖一抖
        contentView.layer.removeAnimation(forKey: "error")
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.values = [-16, 0, 16, 0]
        animation.duration = 0.2
        animation.repeatCount = 3
        contentView.layer.add(animation, forKey: "error")
    }
}

extension QQLoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.accountTF {
            self.passwordTF.becomeFirstResponder()
        }
        
        return true
    }
    
}




















