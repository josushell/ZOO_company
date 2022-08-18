//
//  Ch1SubwayLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import SnapKit
import UIKit

// MARK: - subway layout
class layout_subway {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    
    let talks = TalkData_Subway()
    let profileOrder = ImgOrderData_Subway()
    var talkIndex: [Int] = [0, 0, 0]

    func initView(_ view: UIView) {
        print("init views")
        talks.initTalks()
        
        view.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        backView.backgroundColor = .black
        
        view.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        backgroundImg.frame.size = CGSize(width: vs.width, height: vs.height)
        backgroundImg.image = UIImage(named: "subway")
        
        
        // text box
        view.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backgroundImg)
            make.height.equalTo(74)
            make.width.equalTo(backgroundImg.snp.width)
        }
        textbox.image = UIImage(named: "textback")
        textbox.isHidden = true
        textbox.layer.zPosition = 998
        
        textbox.addSubviews(text)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
        text.setTextAttribute()
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        // profile 설정
        view.addSubviews(profile_player)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "suit_normal")
        profile_player.isHidden = true
        
    }
}
