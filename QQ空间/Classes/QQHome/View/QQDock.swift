//
//  QQDock.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

protocol QQDockDeleagte: NSObjectProtocol, QQTabbarDelegate, QQMenuDelegate {
    
    // 头像
    func dockDidClickHeader()
    
    
}


class QQDock: UIView {

    weak var delegate: QQDockDeleagte? {
        didSet {
            bottom.delegate = delegate
            middle.delegate = delegate
        }
    }
    
    
    lazy var bottom: QQTabbar = {
        let bottom = QQTabbar()
        self.addSubview(bottom)
        return bottom
    }()
    
    lazy var middle: QQMenu = {
        let middle = QQMenu()
        // middle.backgroundColor = UIColor.blue
        self.addSubview(middle)
        return middle
    }()
    
    lazy var headerBtn: QQHeaderBtn = {
        let btn = QQHeaderBtn()
        btn.setImage(UIImage(named: "icon.jpg"), for: .normal)
        btn.setTitle("chase", for: .normal)
        self.addSubview(btn)
        
        btn.addTarget(self, action: #selector(headerClick), for: .touchUpInside)
        
        return btn
    }()
    
    
    @objc func headerClick() {
        // 清除被选中的btn
        middle.clearAllBtnSelect()
        
        self.delegate?.dockDidClickHeader()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 底部试图
        bottom.frame = CGRect(x: 0, y: self.height - kDocTabbarHeight, width: self.width, height: kDocTabbarHeight)
        
        // 中间试图
        middle.frame = CGRect(x: 0, y: self.height - kDocTabbarHeight - kDocMenuHeight, width: self.width, height: kDocMenuHeight)
        
        
        // 顶部试图
        let y: CGFloat = 30
        let x: CGFloat = (self.width - kDockHeaderWidth) * 0.5
        headerBtn.frame = CGRect(x: x, y: y, width: kDockHeaderWidth, height: kDockHeaderHeight)
        
    }

}
