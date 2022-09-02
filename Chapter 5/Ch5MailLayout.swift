//
//  Ch5MailLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/02.
//

import Foundation
import UIKit

class layout_Mail_ch5: layout_base {
    func initView(_ view: UIView) {
        super.initView(view, backImg: "office_on_1", profileImg: "suit_normal")
        talkIndex = [0, 0]   // [주인공, 펭귄(땃쥐)]
    }
}
