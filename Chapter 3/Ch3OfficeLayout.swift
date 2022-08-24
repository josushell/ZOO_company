//
//  layout_Office_ch3.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import SnapKit
import UIKit

// MARK: - 사무실 layout ch3 part1
class layout_Office_ch3: layout_base {
    var minimi_lion = UIImageView()
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
        
        // [주인공, 사자]
        talkIndex = [0, 0]
        
        view.addSubviews(minimi_lion)
        minimi_lion.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(245)
            //make.right.equalTo()
        }
        minimi_lion.image = UIImage(named: "minimi_lion_front")
        minimi_lion.isHidden = true
        minimi_lion.layer.zPosition = Zposition.minimi.rawValue
    }

}
