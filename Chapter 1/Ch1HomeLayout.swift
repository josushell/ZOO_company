//
//  Ch1HomeLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit
import SnapKit

// MARK: - home layout
class layout_home: layout_base {
    let minimi_player = UIImageView()
    
    func initView(_ view: UIView) {
        super.initView(view, backImg: "home", profileImg: "sleep_normal")
        
        talkIndex = [0, 0, 0]
        // profile 설정
        view.addSubviews(minimi_player)
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(71)
            make.trailing.equalTo(backgroundImg.snp.trailing).offset(-176)
        }
        minimi_player.layer.zPosition = Zposition.minimi.rawValue
        minimi_player.image = UIImage(named: "minimi_player_sleep")
    }
}

