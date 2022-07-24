//
//  Choice.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import SpriteKit
import UIKit

class ChoiceFrame: SKScene {
    let choicetexture = SKTextureAtlas(named: "Choices")

    let choice = SKSpriteNode()
    let choice_title = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn1 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn2 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn3 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    var choice_text: String?
    var choices: [String]?
    
    var callbackMethod: ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)?
    
    func setChoose(width: CGFloat, height: CGFloat) {
        // 선택지 배경
        choice.texture = choicetexture.textureNamed("choiceframe3")
        choice.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        choice.position = CGPoint(x: 0.5, y: 0.5)
        choice.size = CGSize(width: width, height: height)
        choice.zPosition = 998
        self.addChild(choice)
        choice.isHidden = true
         
        // 선택지 text 설정
        let heightFix = self.choice.position.y + (self.choice.frame.size.height / 2) - (39 / 2)
        choice_title.text = choice_text ?? ""
        choice_title.fontSize = 16
        choice_title.fontColor = SKColor.black
        choice_title.zPosition = choice.zPosition + 1
        //print("\(self.choice.position.y + (self.choice.frame.size.height / 2))")
        choice_title.position.y = heightFix - 36 - choice_title.frame.size.height / 2
        choice.addChild(choice_title)
        
        choice_btn1.text = choices?[0] ?? ""
        choice_btn1.fontSize = 15
        choice_btn1.fontColor = SKColor.black
        choice_btn1.zPosition = choice.zPosition + 1
        choice_btn1.position.y = heightFix - 72
        choice_btn1.name = Choice.btn1.rawValue
        choice.addChild(choice_btn1)
        
        choice_btn2.text = choices?[1] ?? ""
        choice_btn2.fontSize = 15
        choice_btn2.fontColor = SKColor.black
        choice_btn2.zPosition = choice.zPosition + 1
        choice_btn2.position.y = heightFix - 121
        choice_btn2.name = Choice.btn2.rawValue
        choice.addChild(choice_btn2)
        
        choice_btn3.text = choices?[2] ?? ""
        choice_btn3.fontSize = 15
        choice_btn3.fontColor = SKColor.black
        choice_btn3.zPosition = choice.zPosition + 1
        choice_btn3.position.y = heightFix - 170
        choice_btn3.name = Choice.btn3.rawValue
        choice.addChild(choice_btn3)
    }
    
    func setCallback(callback: @escaping ((_ touches: Set<UITouch>, _ event: UIEvent?) -> Void)) {
        self.callbackMethod = callback
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("yes choice")
        callbackMethod?(touches, event)
    }
    
}
