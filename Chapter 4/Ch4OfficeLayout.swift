//
//  Ch4OfficeLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

class layout_Office_ch4: layout_base {
    // [주인공, 박쥐, 땃쥐]
    // [주인공, 비둘기]
    var minimi_player = UIImageView()
    var minimi_char1 = UIImageView()    // 박쥐, 비둘기
    var minimi_char2 = UIImageView()    // 땃쥐
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
        
        talkIndex = [0, 0, 0]
        
        //minimi 설정
        view.addSubviews(minimi_player, minimi_char1, minimi_char2)
        minimi_player.snp.makeConstraints() { make in
            make.centerX.equalTo(backgroundImg.snp.centerX)
            make.centerY.equalTo(backgroundImg.snp.centerY).offset(10)
        }
        minimi_player.image = UIImage(named: "minimi_player_suit")
        minimi_player.layer.zPosition = Zposition.minimi.rawValue
        
        minimi_char1.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(68)
            //make.leading.equalTo(backgroundImg.snp.leading).offset(440)
            make.left.equalTo(minimi_player.snp.right).offset(35)
        }
        minimi_char1.image = UIImage(named: "minimi_lion_front")
        minimi_char1.isHidden = true
        minimi_char1.layer.zPosition = Zposition.minimi.rawValue
        
        minimi_char2.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            //make.leading.equalTo(backgroundImg.snp.leading).offset(240)
            make.right.equalTo(minimi_player.snp.left).offset(-53)
        }
        minimi_char2.image = UIImage(named: "minimi_mouse_front")
        minimi_char2.isHidden = true
        minimi_char2.layer.zPosition = Zposition.minimi.rawValue
    }
}
