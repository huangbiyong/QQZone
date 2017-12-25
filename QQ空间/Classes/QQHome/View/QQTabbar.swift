//
//  QQTabbar.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

enum QQTabbarType: Int {
    case log        // 日志
    case shuoshuo   // 说说
    case camera     // 相机
}

protocol QQTabbarDelegate:NSObjectProtocol {
    func dockTabbarDidSelect(type: QQTabbarType)
}

class QQTabbar: UIView {

    weak var delegate: QQTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加三个子控件
        self.addBtns()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBtns() {
        let imageNames = ["tabbar_blog", "tabbar_mood", "tabbar_photo"];
        for imageName in imageNames {
            let btn = UIButton()
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.tag = self.subviews.count
            self.addSubview(btn)
            
            btn.addTarget(self, action: #selector(QQTabbar.btnClick(btn:)), for: .touchUpInside)
        }
    }
    
    
    @objc func btnClick(btn: UIButton) {
        self.delegate?.dockTabbarDidSelect(type: QQTabbarType(rawValue: btn.tag)!)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index: CGFloat = 0
        for view in self.subviews {
            if isLandScap() { // 横屏
                let width = self.width / CGFloat(self.subviews.count)
                view.frame = CGRect(x: index * width, y: 0, width: width, height: self.height)
            } else { // 竖屏
                let height = self.height / CGFloat(self.subviews.count)
                view.frame = CGRect(x: 0, y: index * height, width: self.width, height: height)
            }
            index = index + 1
        }
        
    }
    
    
}
