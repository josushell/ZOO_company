//
//  CallbackProtocol.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/10.
//

import Foundation
import SpriteKit

protocol callback {
    var callbackMethod: ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)? { get set }
    func setCallback(callback: @escaping ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void))
}
