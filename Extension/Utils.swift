//
//  utils.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/26.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(red: Int, green: Int, blue:Int, a:Int = 0xFF){
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    convenience init(Hex: Int){
        self.init(red: (Hex >> 16) & 0xFF, green: (Hex >> 8) & 0xFF,
                  blue: Hex & 0xFF)
    }
    convenience init(AHex: Int){
        self.init(red: (AHex >> 16) & 0xFF, green: (AHex >> 8) & 0xFF,
                  blue: AHex & 0xFF, a: (AHex >> 24) & 0xFF)
    }
    
    static let referenceBlue = UIColor(red: 233, green: 244, blue: 246)
    static let referenceBlueBold = UIColor(red: 148, green: 196, blue: 203)
    static let referenceBlueShadow = UIColor(red: 196, green: 234, blue: 239)
    static let radarBlue = UIColor(red: 123, green: 163, blue: 181)
    static let radarBlueBold = UIColor(red: 84, green: 113, blue: 130)
}

enum Choice: String {
    case btn1 = "0"
    case btn2 = "1"
    case btn3 = "2"
}

extension CATransition {
    func fadeTransition(duration: CGFloat = 1.5) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight

        return transition
    }
}

enum Zposition: CGFloat {
    case choice = 999
    case nametagNtextbox = 998
    case blackView = 901
    case profile = 900
    case minimi = 899
}
