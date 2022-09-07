//
//  StartUserNameLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/06.
//

import Foundation
import UIKit
import SnapKit

class StartUserNameLayout {
    let layout_total = UIView()
    let layout_main = UIView()
    let layout_blackView = UIView()
    
    let backgroundImg = UIImageView()
    
    let label_title = UILabel()
    let tf_name = UITextField()
    
    let btn_start = UIButton()
    let label_start = UILabel()
    
    func initView(_ view: UIView) {
        view.addSubviews(layout_total)
        
        layout_total.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_total.isHidden = true
        layout_total.addSubviews(layout_blackView, layout_main)
        
        layout_blackView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_blackView.backgroundColor = .black
        layout_blackView.alpha = 0.2
        layout_blackView.layer.zPosition = Zposition.blackView.rawValue
        
        layout_main.snp.makeConstraints() { make in
            make.height.equalTo(195)
            make.width.equalTo(307)
            make.center.equalToSuperview()
        }
        layout_main.layer.zPosition = Zposition.choice.rawValue
        
        layout_main.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        backgroundImg.image = UIImage(named: "usernameframe")
        
        layout_main.addSubviews(label_title, tf_name, btn_start)
        label_title.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        label_title.setTextAttribute("당신의 이름은 무엇인가요?\n(2~8자 까지 가능합니다)", 16, 4, .black)
        label_title.textAlignment = .center

        tf_name.snp.makeConstraints() { make in
            make.top.equalTo(label_title.snp.bottom).offset(15)
            make.width.equalTo(272)
            make.height.equalTo(36)
            make.centerX.equalToSuperview()
        }
        tf_name.setUserNameInput()
        
        btn_start.snp.makeConstraints() { make in
            make.width.equalTo(145)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
            make.top.equalTo(tf_name.snp.bottom).offset(15)
        }
        btn_start.setChoiceButton(tagValue: 0, ImgNameNormal: "choicebox_normal_mini", ImgNameTouched: "choicebox_touched_minimi")
        btn_start.layer.zPosition = 999
        
        btn_start.addSubview(label_start)
        label_start.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_start.text = "START"
        label_start.textColor = UIColor.black
        label_start.font = UIFont(name: "NeoDunggeunmo-Regular", size: 20)
        label_start.sizeToFit()
    }
}
