//
//  QQMenu.swift
//  QQ空间
//
//  Created by huangbiyong on 2017/12/25.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

protocol QQMenuDelegate: NSObjectProtocol {
    func dockMenuDidSelect(index: Int)
}


class QQMenu: UIView {

    var lastBtn: UIButton?
    weak var delegate: QQMenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加子控件
        self.addBtns()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearAllBtnSelect() {
        self.lastBtn?.isSelected = false
    }
    
    
    func addBtns() {
        let imageNames = ["tab_bar_e_album_icon", "tab_bar_e_more_icon", "tab_bar_feed_icon", "tab_bar_friend_icon", "tab_bar_passive_feed_icon", "tab_bar_pic_wall_icon"]
        let titles = ["电子相框", "更多", "全部动态", "好友", "与我相关", "照片墙"]
        
        for i in 0..<6 {
            addBtn(imageName: imageNames[i], title: titles[i])
        }
    }
    
    func addBtn(imageName: String, title: String) {
        let btn = QQMenuBtn()

        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_separate_selected_bg"), for: .selected)
        btn.setTitle(title, for: .normal)
        btn.tag = self.subviews.count
        btn.addTarget(self, action: #selector(QQMenu.btnClick(btn:)), for: .touchUpInside)
        
        self.addSubview(btn)
    }
    
    @objc func btnClick(btn: UIButton) {
        
        lastBtn?.isSelected = false
        btn.isSelected = true
        lastBtn = btn
        
        self.delegate?.dockMenuDidSelect(index: btn.tag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index: CGFloat = 0
        let height: CGFloat = self.height / CGFloat(self.subviews.count)
        
        for view in self.subviews {
            view.frame = CGRect(x: 0, y: height * index, width: self.width, height: height)
            index = index + 1
        }
    }
    
}
