//
//  Ch1SubwayLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import SnapKit
import UIKit

class layout_subway: layout_base {
    func initView(_ view: UIView) {
        super.initView(view, backImg: "subway", profileImg: "suit_normal")
        talkIndex = [0]
    }
}
