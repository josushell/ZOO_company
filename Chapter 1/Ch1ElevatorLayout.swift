//
//  Ch1ElevatorLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/19.
//

import Foundation
import UIKit
import SnapKit

class layout_elevator {
    let vs = viewSize()
    let backView = UIView()
    let backgroundImg = UIImageView()
    let label = UILabel()
    
    func initView(_ view: UIView) {
        print("init views")
        
        view.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
        backView.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        backgroundImg.image = UIImage(named: "elevator")
        
        backgroundImg.addSubview(label)
        label.snp.makeConstraints() { make in
            make.leading.equalTo(backgroundImg.snp.trailing)
            make.bottom.equalToSuperview().offset(-17)
        }
        label.setTextAttribute("엘리베이터에서는 쉬세요...", 16)
    }
        
}
