//
//  utils.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/26.
//

import Foundation
import UIKit

// MARK: - UIColor Hex Color 변환 코드 추가
extension UIColor{
    convenience init(red: Int, green: Int, blue:Int, a:Int = 0xFF){
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    // MARK: hexa code
    convenience init(Hex: Int){
        self.init(red: (Hex >> 16) & 0xFF, green: (Hex >> 8) & 0xFF,
                  blue: Hex & 0xFF)
    }
    convenience init(AHex: Int){
        self.init(red: (AHex >> 16) & 0xFF, green: (AHex >> 8) & 0xFF,
                  blue: AHex & 0xFF, a: (AHex >> 24) & 0xFF)
    }
}

// MARK: - 선택된 버튼 번호 enum
enum Choice: String {
    case btn1 = "0"
    case btn2 = "1"
    case btn3 = "2"
}

// MARK: - view controller fade effect
extension CATransition {
    func fadeTransition(duration: CGFloat = 1.5) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight

        return transition
    }
}
