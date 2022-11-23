//
//  layout_Office_ch3.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import SnapKit
import UIKit

class layout_Office_ch3: layout_base {
    var minimi_lion = UIImageView()
    var minimi_palyer = UIImageView()
    
    func initView(_ view: UIView, backImg: String = "office_on_2") {
        super.initView(view, backImg: backImg, profileImg: "suit_normal")
        talkIndex = [0, 0]
        
        view.addSubviews(minimi_lion, minimi_palyer)
        minimi_lion.snp.makeConstraints() { make in
            make.centerX.equalTo(backgroundImg.snp.centerX)
            make.centerY.equalTo(backgroundImg.snp.centerY).offset(-20)
        }
        minimi_lion.image = UIImage(named: "minimi_lion_front")
        minimi_lion.isHidden = true
        minimi_lion.layer.zPosition = Zposition.minimi.rawValue
        
        minimi_palyer.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.right.equalTo(backgroundImg.snp.right).offset(-16)
        }
        minimi_palyer.image = UIImage(named: "minimi_player_suit")
        minimi_palyer.isHidden = true
        minimi_palyer.layer.zPosition = Zposition.minimi.rawValue
    }

}
