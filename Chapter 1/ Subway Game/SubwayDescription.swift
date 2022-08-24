//
//  SubwayDescription.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/23.
//

import Foundation
import SpriteKit
import UIKit
import SnapKit

class SubwayDescription {
    let layout_main = UIView()
    let btn_start = UIButton()
    let label_start = UILabel()
    let layout_description = UIImageView()
    
    func initViews(_ view: UIView) {
        view.addSubviews(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.width.equalTo(445)
            make.height.equalTo(203)
            make.center.equalToSuperview()
        }
        
        layout_main.addSubviews(btn_start, layout_description)
        layout_description.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_description.image = UIImage(named: "subway_description")
        
        btn_start.snp.makeConstraints() { make in
            make.width.equalTo(145.08)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        btn_start.setChoiceButton(tagValue: 0, ImgName: "choicebox_normal_mini")
        btn_start.layer.zPosition = 999
        
        btn_start.addSubview(label_start)
        label_start.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_start.text = "GAME START"
        label_start.textColor = UIColor.black
        label_start.font = UIFont(name: "NeoDunggeunmo-Regular", size: 20)
        label_start.sizeToFit()
    }
}
