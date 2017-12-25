//
//  Common.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit


// YES ： 横屏    NO: 竖屏
func isLandScap() -> Bool {
    let bounds = UIScreen.main.bounds
    return bounds.size.width > bounds.size.height
}

var kDocWidth: CGFloat {
    get {
        return isLandScap() ? 210 : 70
    }
}


// Dock 底部试图的高度
var kDocTabbarHeight: CGFloat {
    return isLandScap() ? 70 : 210
}

// Dock 中部试图的高度
var kDocMenuHeight: CGFloat {
    return 540
}

// Dock headerBtn 高度
var kDockHeaderHeight: CGFloat {
    return isLandScap() ? 130 : 60
}


// Dock headerBtn 宽度
var kDockHeaderWidth: CGFloat {
    return isLandScap() ? 120 : 60
}





