//
//  StartScene.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/06/01.
//

import Foundation
import SpriteKit

// MARK: 시작 scene
class StartScene: SKScene {
    var controller: UIViewController?
    let textureAtlas = SKTextureAtlas(named: "start")
    let startBtn = SKSpriteNode()
    var alert: UIAlertController!
    let framesize = FrameSize()
    
    let back_bgm = SKAudioNode(fileNamed: "start_music")
    let button_bgm = SKAction.playSoundFileNamed("button_clicked", waitForCompletion: false)
    
    // MARK: - entry point
    override func didMove(to view: SKView) {
        // MARK: set user name input
        setUserNameInput()
    
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255)
        
        let backFrame: [SKTexture] = [textureAtlas.textureNamed("1"), textureAtlas.textureNamed("2"),
                                     textureAtlas.textureNamed("3"), textureAtlas.textureNamed("4")]
        let backAction = SKAction.animate(with: backFrame, timePerFrame: 0.5)
        let backgroundImg = SKSpriteNode(imageNamed: "1")
        backgroundImg.size = CGSize(width: framesize.width , height: framesize.height)
        backgroundImg.anchorPoint = CGPoint.zero
        backgroundImg.position = CGPoint.zero
        print("\(backgroundImg.size.width), \(backgroundImg.size.height)")
        
        var mainAnim = SKAction()
        mainAnim = SKAction.repeatForever(backAction)
        
        backgroundImg.run(mainAnim)
        self.addChild(backgroundImg)
        
        // MARK: background music
        self.addChild(back_bgm)
        back_bgm.run(SKAction.play())
        
        // MARK: Start button settings
        startBtn.texture = textureAtlas.textureNamed("startbtn")
        startBtn.size = CGSize(width: 200, height: 100)
        startBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        startBtn.position = CGPoint(x: framesize.width / 2, y: 50)
        startBtn.name = "StartBtn"
        
        let counterDecrement = SKAction.sequence([SKAction.wait(forDuration: 1.0)])
        run(SKAction.sequence([SKAction.repeat(counterDecrement, count: 5), SKAction.run(registerButton)]))
    }
    
    func registerButton() {
        self.addChild(startBtn)
    }
    
    func setUserNameInput() {
        // MARK: text field 설정
        self.alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        let titlefont = [NSAttributedString.Key.font: UIFont(name: "NeoDunggeunmo-Regular", size: 18.0)!]
        let msgfont = [NSAttributedString.Key.font: UIFont(name: "NeoDunggeunmo-Regular", size: 14.0)!]

        let titleStr = NSMutableAttributedString(string: "당신의 이름은 무엇인가요?", attributes: titlefont)
        let msgStr = NSMutableAttributedString(string: "(2~8자 까지 가능합니다)", attributes: msgfont)
        
        self.alert.setValue(titleStr, forKey: "attributedTitle")
        self.alert.setValue(msgStr, forKey: "attributedMessage")
        
        let action = UIAlertAction(title: "START", style: .default, handler: btnHandler)
        action.setValue(UIColor.black, forKey: "titleTextColor")
        
        self.alert.addAction(action)
        self.alert.addTextField(configurationHandler: {(myTextField) in
            // textfield custom
            myTextField.font = UIFont(name: "NeoDunggeunmo-Regular", size: 18)
            myTextField.placeholder = "닉네임을 설정해주세요"
            myTextField.addConstraint(myTextField.heightAnchor.constraint(equalToConstant: 20))
        })
        self.alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .lightGray
    }
    
    // MARK: - button completion handler
    func btnHandler(alert: UIAlertAction)
    {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            appdel.name = self.alert.textFields?[0].text ?? "anonymous"
        }
        
        back_bgm.run(SKAction.changeVolume(to: 0, duration: 1))
        self.run(SKAction.wait(forDuration: 1), completion: {
            self.run(self.button_bgm, completion: {
                self.run(SKAction.wait(forDuration: 1), completion: {
                    self.controller?.dissmissAndPresent(Ch1Part1ViewController(), animated: false, completion: nil)
                })
            })
        })
    }
    
    // MARK: - start button touch event delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            
            // 화면 전환
            if nodeTouched.name == "StartBtn" {
                self.controller?.present(self.alert, animated: false, completion: nil)
            }
        }
    }
}
