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
    var talkIndex: [Int] = [0, 0, 0]
    
    var minimi_player = UIImageView()
    var minimi_char1 = UIImageView()    // 박쥐, 비둘기
    var minimi_char2 = UIImageView()    // 땃쥐
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
    }
}
