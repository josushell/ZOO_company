//
//  Dialog.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/10.
//

import Foundation
import SpriteKit

class Dialog: SKScene {
    let width = UIScreen.main.bounds.width - (42 * 2)
    let height = UIScreen.main.bounds.height - (46 * 2)
    
    let box = SKSpriteNode()
    let profile = SKSpriteNode()
    let dialog = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    let backtexture = SKTextureAtlas(named: "Back")
    let profileAtlas = SKTextureAtlas(named: "Profile")
    
    var callbackMethod: ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)?
    
    func setDialog(backgroundImg: SKSpriteNode, width: CGFloat, height: CGFloat) {
        // text box 설정
        box.texture = backtexture.textureNamed("textback")
        box.size = CGSize(width: width, height: 74)
        box.position.x = 0.5
        let framesize = backgroundImg.frame.size.height / 2
        box.position.y = 0.5 - framesize + (74 / 2)
        backgroundImg.addChild(box)
        box.zPosition = 996
        box.isHidden = true
        
        // profile image 설정
        profile.texture = profileAtlas.textureNamed("suit_normal")
        profile.size = CGSize(width: 130, height: 131.81)
        
        // MARK: - 위치 조정 다시 필요
        profile.position.x = self.box.position.x - self.width / 2 + 108 + 130 / 2
        profile.position.y = self.box.position.y + self.box.frame.size.height / 2 + 131.81 + 131.81 / 3
        box.addChild(profile)
        
        // dialog 설정
        dialog.text = ""
        dialog.numberOfLines = 0
        dialog.fontSize = 15
        dialog.fontColor = SKColor.white
        dialog.zPosition = box.zPosition + 1
        // 최대 width 제한하기
        dialog.preferredMaxLayoutWidth = backgroundImg.frame.width - 64
        dialog.position.y = dialog.position.y - dialog.frame.height / 2
        box.addChild(dialog)
    }
    
    func setCallback(callback: @escaping ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)) {
        self.callbackMethod = callback
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("yes dialog")
        callbackMethod?(touches, event)
    }
    
}
