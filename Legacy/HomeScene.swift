//
//  HomeScene.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/06/23.
//

import Foundation
import UIKit
import SpriteKit

// MARK: home scene
class HomeScene: SKScene {
    let vs = ViewSize()
    
    let chartexture = SKTextureAtlas(named: "Minimi")
    let backtexture = SKTextureAtlas(named: "Back")
    let choicetexture = SKTextureAtlas(named: "Choices")
    let profileAtlas = SKTextureAtlas(named: "Profile")
    var backgroundImg = SKSpriteNode()
    
    let char = SKSpriteNode()
    
    let box = SKSpriteNode()
    let profile = SKSpriteNode()
    let dialog = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    let talks = ["드디어 기다리고 기다리던 첫 출근이야!", "당장 준비하고 출발해볼까?", "잠깐! 1시간이나 일찍 일어났잖아?", "흠… 첫 출근에 일찍 일어났네 이제 어떻게 하지?"]
    var talkIndex = 0
    let choices = ["1. 1시간 일찍 간다", "2. 그냥 더 잔다", "3. 아침밥을 먹는다"]
    let choice_text = "Q.  출근 전 일찍 일어났을 때는 어떻게 할까?"
    let choice_talks = ["일찍 일어난 새가 벌레를 잡는다고 하지! 이왕 일찍 일어난 김에 1시간 먼저 나가서 청소도 하고 업무도 미리미리 해야지!", "내가 그렇게 까지 열심히 살아야 해? 일찍 일어나는 새가 일찍 피곤하다.. 더 자야지", "첫 출근이니까 완벽하게 준비를 해야지. 아침밥 먹고 힘내서 출근하자! "]
    let player_image = ["sleep_normal", "sleep_stare", "sleep_surprise", "sleep_surprise"]
    let response_image = ["sleep_fire", "sleep_tired", "sleep_normal"]
    var flag: Bool = false
    
    let choice = SKSpriteNode()
    let choice_title = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn1 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn2 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    let choice_btn3 = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    // MARK: - entry point
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFit
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0)
    
        setBackground()
        setDialog()
        setChoose()
    }
    
    // MARK: - background 설정
    func setBackground() {
        // 배경 이미지 설정
        backgroundImg.texture = backtexture.textureNamed("home")
        //backgroundImg.size = CGSize(width: vs.width, height: vs.height)
        self.addChild(backgroundImg)
        
        // player 설정
        char.texture = chartexture.textureNamed("player_char1")
        char.size = CGSize(width: 60.23, height: 68)
        char.position = CGPoint(x: 130, y: -50)
        char.zPosition = 995
        self.addChild(char)
    }
    
    // MARK: - text box + dialog + profile image 설정
    func setDialog() {
        // text box 설정
        box.texture = backtexture.textureNamed("textback")
        //box.size = CGSize(width: vs.width, height: 74)
        box.position.x = 0.5
        let framesize = backgroundImg.frame.size.height / 2
        box.position.y = 0.5 - framesize + (74 / 2)
        backgroundImg.addChild(box)
        box.zPosition = 996
        box.isHidden = true
        
        // profile image 설정
        profile.texture = profileAtlas.textureNamed("sleep_normal")
        profile.size = CGSize(width: 130, height: 131.81)
        
        // MARK: - 위치 조정 다시 필요
        profile.position.x = self.box.position.x - self.frame.size.width / 2 + 108 + 130 / 2
        profile.position.y = self.box.position.y + self.box.frame.size.height / 2 + 131.81 + 131.81 / 3
        box.addChild(profile)
        
        // dialog 설정
        dialog.text = ""
        dialog.numberOfLines = 0
        dialog.fontSize = 15
        dialog.fontColor = SKColor.white
        dialog.zPosition = box.zPosition + 1
        // 최대 width 제한하기
        dialog.preferredMaxLayoutWidth = self.backgroundImg.frame.width - 64
        dialog.position.y = dialog.position.y - dialog.frame.height / 2
        box.addChild(dialog)
    }
    
    // MARK: - 선택지 설정
    func setChoose() {
        // 선택지 배경
        choice.texture = choicetexture.textureNamed("choiceframe3")
        choice.position = CGPoint(x: 0.5, y: 0.5)
        //choice.size = CGSize(width: vs.width, height: vs.height)
        choice.zPosition = 998
        self.addChild(choice)
        choice.isHidden = true
         
        // 선택지 text 설정
        let heightFix = self.choice.position.y + (self.choice.frame.size.height / 2) - (39 / 2)
        choice_title.text = choice_text
        choice_title.fontSize = 16
        choice_title.fontColor = SKColor.black
        choice_title.zPosition = choice.zPosition + 1
        //print("\(self.choice.position.y + (self.choice.frame.size.height / 2))")
        choice_title.position.y = heightFix - 36 - choice_title.frame.size.height / 2
        choice.addChild(choice_title)
        
        choice_btn1.text = choices[0]
        choice_btn1.fontSize = 15
        choice_btn1.fontColor = SKColor.black
        choice_btn1.zPosition = choice.zPosition + 1
        choice_btn1.position.y = heightFix - 72
        choice_btn1.name = Choice.btn1.rawValue
        choice.addChild(choice_btn1)
        
        choice_btn2.text = choices[1]
        choice_btn2.fontSize = 15
        choice_btn2.fontColor = SKColor.black
        choice_btn2.zPosition = choice.zPosition + 1
        choice_btn2.position.y = heightFix - 121
        choice_btn2.name = Choice.btn2.rawValue
        choice.addChild(choice_btn2)
        
        choice_btn3.text = choices[2]
        choice_btn3.fontSize = 15
        choice_btn3.fontColor = SKColor.black
        choice_btn3.zPosition = choice.zPosition + 1
        choice_btn3.position.y = heightFix - 170
        choice_btn3.name = Choice.btn3.rawValue
        choice.addChild(choice_btn3)
    }
    
    // MARK: - touch delegate method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        box.isHidden = false
        
        if (choice.isHidden == true) {
            if (talkIndex < 4) {
                dialog.text = talks[talkIndex]
                dialog.position.x = self.box.position.x - self.box.frame.width / 2 + self.dialog.frame.width / 2 + 32
                
                if (talkIndex == 0) {
                    dialog.position.y = dialog.position.y - dialog.frame.height / 2
                }
                
                talkIndex += 1
            }
            else {
                choice.isHidden = false
            }
        }
        
        //(touchNode as? SKSpriteNode)?.texture = backtexture.textureNamed("choicetouched")
        else {
            if (flag == true) {
                self.view?.presentScene(SubwayScene(size: self.size), transition: .fade(withDuration: 2))
            }
            
            else {
                for touch in touches {
                    let touchNode = atPoint(touch.location(in: self))
                    
                    if (touchNode.name == Choice.btn1.rawValue
                        || touchNode.name == Choice.btn2.rawValue
                        || touchNode.name == Choice.btn3.rawValue) {
                        
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
                        
                        dialog.text = choice_talks[index]
                        dialog.position.x = self.box.position.x - self.box.frame.width / 2 + self.dialog.frame.width / 2 + 32
                        flag = true
                    }
                }
            }
        }
    }
}
