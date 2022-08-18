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
    // [주인공, 사자]
    var talkIndex: [Int] = [0, 0]
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
    }

}
