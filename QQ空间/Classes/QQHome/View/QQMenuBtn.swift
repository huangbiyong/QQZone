//
//  QQMenuBtn.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class QQMenuBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView?.contentMode = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let radio: CGFloat = 0.3
    
    // title fram
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() { // 横屏
            return CGRect(x: radio * contentRect.size.width, y: 0, width: contentRect.size.width * (1 - radio), height: contentRect.size.height)
        } else { // 竖屏
            return .zero
        }
    }
    
    // image frame
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if isLandScap() { // 横屏
            return CGRect(x: 0, y: 0, width: radio * contentRect.size.width, height: contentRect.size.height)
        } else { // 竖屏
            return contentRect
        }
    }
    

}
