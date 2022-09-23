//
//  EndingLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/21.
//

import Foundation
import UIKit

// MARK: - Ending layout: dialog + backgroundImg
class layout_ending: layout_base {
    func initView(_ view: UIView) {
        super.initView(view, backImg: "ending1", profileImg: "suit_normal")
        talkIndex = [0]   // [narration]
        
        backgroundImg.snp.remakeConstraints() { make in
            make.center.equalToSuperview()
        }
    }
}
