//
//  QQHomeVC.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class QQHomeVC: UIViewController {

    // 状态栏的文字变为白色
    override var preferredStatusBarStyle: UIStatusBarStyle{get { return.lightContent}}
    
    lazy var leftView: QQDock = {
        let leftView = QQDock()
        leftView.delegate = self
        //self.view.addSubview(leftView)
        
        self.view.insertSubview(leftView, at: 0)
        
        return leftView
    }()
    
    lazy var rightView: UIView = {
        let rightView = UIView()
        rightView.backgroundColor = UIColor.brown
        self.view.addSubview(rightView)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(ges:)))
        rightView.addGestureRecognizer(pan)
        
        return rightView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // 添加子控制器
        addChildVCs()
        
        // 默认选中 个人中心
        dockDidClickHeader()
    }
}

// 添加子控制器
extension QQHomeVC {
    
    func addChildVCs() {
        self.addChildVC(vc: UIViewController(), title: "电子相框")
        self.addChildVC(vc: UIViewController(), title: "更多")
        self.addChildVC(vc: UIViewController(), title: "全部动态")
        self.addChildVC(vc: UIViewController(), title: "好友")
        self.addChildVC(vc: UIViewController(), title: "与我相关")
        self.addChildVC(vc: UIViewController(), title: "照片墙")
        
        
        self.addChildVC(vc: UIViewController(), title: "个人中心")
    }
    
    func addChildVC(vc: UIViewController, title: String) {
        vc.title = title
        let nav = UINavigationController(rootViewController: vc)
        self.addChildViewController(nav)
    }
    
}


// 界面处理
extension QQHomeVC {
    func setupUI() {
        self.view.backgroundColor = UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1.0)
    }
    
    // 拖动手势
    @objc func pan(ges: UIPanGestureRecognizer) {
        
        if ges.state == .changed {
            let x = ges.translation(in: self.rightView).x
            self.rightView.x = self.leftView.width + x * 0.7
        } else {
            
            UIView.animate(withDuration: 0.1, animations: {
                self.rightView.x = self.leftView.width
            })
        }
    }
    
    
    
    // 在这里可以监听屏幕的重新布局，包括屏幕的横竖屏
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
        let x: CGFloat = 0
        let y: CGFloat = 0
        let height: CGFloat = view.height
        leftView.frame = CGRect(x: x, y: y, width: kDocWidth, height: height)
        
        rightView.frame = CGRect(x: kDocWidth, y: y, width: view.width - kDocWidth, height: height)
    }
}

extension QQHomeVC: QQDockDeleagte {
    
    func dockDidClickHeader() {
        //print("dockDidClickHeader")
        
        // 1. 移除之前添加的视图
        let subView = rightView.subviews.first
        subView?.removeFromSuperview()
        
        // 2. 获取最新的视图,添加进来
        let vc = self.childViewControllers.last
        vc?.view.frame = rightView.bounds
        rightView.addSubview((vc?.view)!)
        
    }
    
    func dockTabbarDidSelect(type: QQTabbarType) {
        //print(type.rawValue)
        
        let vc = QQTabbarVC()
        vc.view.backgroundColor = UIColor.red
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .formSheet
        self.present(nav, animated: true, completion: nil)
    }
    
    func dockMenuDidSelect(index: Int) {
        // print(index)
        
        // 1. 移除之前添加的视图
        let subView = rightView.subviews.first
        subView?.removeFromSuperview()
        
        // 2. 获取最新的视图,添加进来
        let vc = self.childViewControllers[index]
        vc.view.frame = rightView.bounds
        rightView.addSubview((vc.view)!)
    }
}









