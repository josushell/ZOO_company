//
//  Office.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import SpriteKit
import UIKit

// MARK: Office Scene
class OfficeScene: SKScene {
    let talks = ["드디어 기다리고 기다리던 첫 출근이야!", "당장 준비하고 출발해볼까?", "잠깐! 1시간이나 일찍 일어났잖아?", "흠… 첫 출근에 일찍 일어났으니까 일찍 가서 뭐라도 좀 해볼까?"]
    let choices = ["1. 일찍 간다", "2. 그냥 더 잔다", "3. 아침밥을 먹는다"]
    let choice_text = "Q. 일찍 일어났을 때는 어떻게 할까?"
    let choice_talks = ["일찍 일어난 새가 벌레를 잡는다고 하지! 이왕 일찍 일어난 김에 1시간 먼저 나가서 청소도 하고 업무도 미리미리 해야지! 열정! 열정! 열정!", "내가 그렇게 까지 열심히 살아야 해? 일찍 일어나는 새는 일찍 피곤하다. 더 자야지", "요새 너무 힘이 없네.. 첫 출근인데 이럴 순 없지. 아침밥 먹고 힘내서 출근하자"]
    var talkIndex = 0
    var flag: Bool = false
    
    let back = Back()
    let vs = viewSize()
    
    let dialog = Dialog()
    
    let choice = ChoiceFrame()
    
    
    // MARK: - entry point
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFit
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0)
        
        //back.size = self.size
        back.setBackground(backImgName: "office_off", charImgName: "player_char1", width: vs.width, height: vs.height)
        //back.setCallback(callback: touchesBegan(_:with:))
        back.setCallback(callback: touchesBegan(_:with:))
        self.addChild(back)
        
        dialog.setDialog(backgroundImg: self.back.backgroundImg, width: vs.width, height: vs.height)
        dialog.setCallback(callback: touchesBegan(_:with:))
        self.addChild(dialog)
        
        choice.setChoose(width: vs.width, height: vs.height)
        choice.choices = self.choices
        choice.choice_text = self.choice_text
        choice.setCallback(callback: touchesBegan(_:with:))
        self.addChild(choice)
    }
    
    // MARK: - touch delegate method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dialog.box.isHidden = false
        
        if (choice.choice.isHidden == true) {
            if (talkIndex < 4) {
                back.resignFirstResponder()
                dialog.becomeFirstResponder()
                
                self.dialog.dialog.text = talks[talkIndex]
                self.dialog.dialog.position.x = self.dialog.box.position.x - self.dialog.box.frame.width / 2 + self.dialog.dialog.frame.width / 2 + 32
                
                if (talkIndex == 0) {
                    self.dialog.dialog.position.y = self.dialog.dialog.position.y - self.dialog.dialog.frame.height / 2
                }
                
                talkIndex += 1
            }
            else {
                //talkIndex = 0
                self.dialog.resignFirstResponder()
                choice.choice.isHidden = false
                choice.becomeFirstResponder()
            }
        }
        
        //(touchNode as? SKSpriteNode)?.texture = backtexture.textureNamed("choicetouched")
        
        else {
            if (flag == true) {
                self.view?.presentScene(HomeScene(size: self.size), transition: .fade(withDuration: 2))
            }
            
            else {
                for touch in touches {
                    let touchNode = atPoint(touch.location(in: self))
                    if (touchNode.name == Choice.btn1.rawValue
                        || touchNode.name == Choice.btn2.rawValue
                        || touchNode.name == Choice.btn3.rawValue) {
                        
                        print("\(touchNode.position.x)")
                        
                        let appdel = UIApplication.shared.delegate as? AppDelegate
                        var index: Int = 10
                        
                        if (touchNode.name == Choice.btn1.rawValue) {
                            index = Int(Choice.btn1.rawValue) ?? 0
                        }
                        else if (touchNode.name == Choice.btn2.rawValue) {
                            index = Int(Choice.btn2.rawValue) ?? 0
                        }
                        else if (touchNode.name == Choice.btn3.rawValue) {
                            index = Int(Choice.btn3.rawValue) ?? 0
                        }
                        
                        appdel?.resultData[index] += 1
                        choice.removeFromParent()
                        
                        self.dialog.dialog.text = talks[talkIndex]
                        self.dialog.dialog.position.x = self.dialog.box.position.x - self.dialog.box.frame.width / 2 + self.dialog.dialog.frame.width / 2 + 32
                        flag = true
                    }
                }
            }
        }
         
    }
    
    func choiceSelected() {
        
    }
    
}
