//
//  Ch2OfficeLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit
import SnapKit

// MARK: - 사무실 layout 1
class layout_Office_ch2_part1: layout_base {
    
    var talkIndex: [Int] = [0, 0, 0]
    let minimi_player = UIImageView()
    let minimi_lion = UIImageView()
    let minimi_mouse = UIImageView()
    let minimi_response = UIImageView()
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_off", profileImg: "suit_shy", choiceWidth: 480)
        
        //minimi 설정
        view.addSubviews(minimi_player, minimi_lion, minimi_mouse, minimi_response)
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(81)
            make.centerX.equalTo(backgroundImg.snp.centerX)
        }
        minimi_player.image = UIImage(named: "minimi_player_suit")
        
        minimi_lion.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_lion.image = UIImage(named: "minimi_lion_front")
        minimi_lion.isHidden = true
        
        minimi_mouse.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_mouse.image = UIImage(named: "minimi_mouse_front")
        minimi_mouse.isHidden = true
        
        minimi_response.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(68)
            make.leading.equalTo(backgroundImg.snp.leading).offset(440)
        }
        minimi_response.isHidden = true
        
        
    }
}


// MARK: - 사무실 layout 2
class layout_Office_ch2_part2: layout_base {
    // [알파카, 주인공, 사자, 신원불명]
    var talkIndex: [Int] = [0, 0, 0, 0]
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
    }
}
