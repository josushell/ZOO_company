//
//  EndingLayout.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/21.
//

import Foundation
import UIKit

class layout_ending: layout_base {
    let frameSize = FrameSize()
    let viewSize = ViewSize()
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "ending1", profileImg: "suit_normal")
        talkIndex = [0]
        
        backgroundImg.snp.remakeConstraints() { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(frameSize.height)
        }
        
        textbox.snp.remakeConstraints() { make in
            make.centerX.equalTo(frameSize.width / 2)
            make.bottom.equalTo(backgroundImg).offset(-30)
            make.height.equalTo(74)
            make.width.equalTo(viewSize.width)
        }
    }
}
