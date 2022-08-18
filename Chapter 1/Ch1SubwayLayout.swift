//
//  Ch1SubwayLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import SnapKit
import UIKit

// MARK: - subway layout
class layout_subway: layout_base {
    var talkIndex: [Int] = [0]
    func initView(_ view: UIView) {
        super.initView(view, backImg: "subway", profileImg: "suit_normal")
    }
}
