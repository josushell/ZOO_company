//
//  IDCardLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/17.
//

import Foundation
import UIKit
import SnapKit

class layout_IDCard {
    let fs = FrameSize()

    let layout_main = UIImageView()
    let layout_card = UIImageView()

    let layout_profileView = UIView()
    let layout_profile = UIImageView()
    let layout_glitter = UIImageView()

    let btn_back = UIButton()
    let btn_home = UIImageView()
    let btn_share = UIImageView()
    
    let label_share = UILabel()
    let label_home = UILabel()
    
    let label_txt = UILabel()
    
    let layout_lionhand = UIImageView()

    func initViews(_ view: UIView) {
        view.addSubviews(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(fs.height)
            make.width.equalTo(fs.width)
        }
        layout_main.image = UIImage(named: "IDCardBack")
        
        layout_main.addSubviews(layout_card, btn_back, btn_home, btn_share, layout_lionhand)
        btn_home.snp.makeConstraints() { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-37)
            make.right.equalToSuperview().offset(-9)
        }
        btn_home.layer.zPosition = 999
        btn_home.image = UIImage(named: "btnHome")
        
        btn_share.snp.makeConstraints() { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.bottom.equalTo(btn_home.snp.top).offset(-16)
            make.centerX.equalTo(btn_home.snp.centerX)
        }
        btn_share.layer.zPosition = 999
        btn_share.image = UIImage(named: "btnShare")
        
        layout_card.snp.makeConstraints() { make in
            make.width.equalTo(510)
            make.height.equalTo(327)
            make.bottom.equalTo(layout_main.snp.top)
            make.centerX.equalToSuperview()
        }
        layout_card.image = UIImage(named: "IDCard")
        
        layout_card.addSubviews(layout_profileView, layout_glitter, label_txt)
        layout_profileView.snp.makeConstraints() { make in
            make.width.equalTo(138)
            make.height.equalTo(188)
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(63)
        }
        layout_profileView.backgroundColor = .white
        
        layout_profileView.addSubview(layout_profile)
        layout_profile.snp.makeConstraints() { make in
            make.width.equalTo(138)
            make.height.equalTo(146)
            make.center.equalToSuperview()
        }
        layout_profile.image = UIImage(named: "")
        
        layout_glitter.snp.makeConstraints() { make in
            make.width.equalTo(162)
            make.height.equalTo(169)
            make.top.left.equalToSuperview()
        }
        layout_glitter.image = UIImage(named: "IDCardGlitter")
        
        btn_back.snp.makeConstraints() { make in
            make.width.height.equalTo(70)
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(64)
        }
        btn_back.layer.zPosition = 999
        
        btn_share.addSubview(label_share)
        label_share.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        label_share.setTextAttribute("#공유하기", 13, 1, .black)
        
        btn_home.addSubview(label_home)
        label_home.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        label_home.setTextAttribute("#홈으로", 13, 1, .black)
        
        label_txt.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(82)
            make.left.equalToSuperview().offset(228)
            make.height.equalTo(152)
        }
        label_txt.setTextAttribute("test", 20, 10, .black)
        
        layout_lionhand.snp.makeConstraints() { make in
            make.width.equalTo(253)
            make.height.equalTo(272)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(layout_main.snp.top)
        }
        layout_lionhand.image = UIImage(named: "lionHand")
    }
}
