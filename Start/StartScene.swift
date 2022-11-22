//
//  StartScene.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/06/01.
//

import Foundation
import SpriteKit
import UIKit

// MARK: 시작 scene
class StartScene: SKScene {
    var controller: UIViewController?
    let textureAtlas = SKTextureAtlas(named: "start")
    let startBtn = SKSpriteNode()
    let framesize = FrameSize()

    let layout_userNameInput = StartUserNameLayout()

    let back_bgm = SKAudioNode(fileNamed: "start_music")
    let button_bgm = SKAction.playSoundFileNamed("button_clicked", waitForCompletion: false)

    // MARK: - entry point
    override func didMove(to view: SKView) {
        // MARK: set user name input
        layout_userNameInput.initView(view)
        layout_userNameInput.btn_start.addTarget(self, action: #selector(startGame(_:)), for: .touchUpInside)
        layout_userNameInput.tf_name.delegate = self
        textfieldkeyboardsetup()
    
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255)
        
        let backFrame: [SKTexture] = [textureAtlas.textureNamed("1"), textureAtlas.textureNamed("2"), textureAtlas.textureNamed("3"), textureAtlas.textureNamed("4")]
        let backAction = SKAction.animate(with: backFrame, timePerFrame: 0.5)
        let backgroundImg = SKSpriteNode(imageNamed: "1")
        backgroundImg.size = CGSize(width: framesize.width , height: framesize.height)
        backgroundImg.anchorPoint = CGPoint.zero
        backgroundImg.position = CGPoint.zero
        backgroundImg.zPosition = Zposition.blackView.rawValue
        
        var mainAnim = SKAction()
        mainAnim = SKAction.repeatForever(backAction)
        
        backgroundImg.run(mainAnim)
        self.addChild(backgroundImg)
        
        // MARK: background music
        self.addChild(back_bgm)
        back_bgm.run(SKAction.play())
        
        // MARK: Start button settings
        startBtn.texture = textureAtlas.textureNamed("startbtn")
        startBtn.size = backgroundImg.size
        startBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        startBtn.position = CGPoint(x: framesize.width / 2, y: 100)
        startBtn.zPosition = Zposition.choice.rawValue
        startBtn.name = "StartBtn"
        
        let counterDecrement = SKAction.sequence([SKAction.wait(forDuration: 1.0)])
        run(SKAction.sequence([SKAction.repeat(counterDecrement, count: 5), SKAction.run(registerButton)]))
    }
    
    func registerButton() {
        self.addChild(startBtn)
    }
    
    // MARK: - button completion handler
    @objc func startGame(_ sender: UIButton)
    {
        self.layout_userNameInput.layout_total.removeFromSuperview()
        
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            appdel.name = self.layout_userNameInput.tf_name.text ?? "anonymous"
            appdel.GameStat = [0, 0, 0, 0, 0]
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
                self.layout_userNameInput.layout_total.isHidden = false
                self.startBtn.isHidden = true
            }
        }
    }
}

// MARK: - UITextfield delegate에 따른 layout 수정
extension StartScene: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.layout_userNameInput.tf_name.resignFirstResponder()
        return true
    }
    
    // 키보드 설정
    func textfieldkeyboardsetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: NSNotification) {
        var keyboardHeight: CGFloat = 0.0
        
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        self.layout_userNameInput.layout_main.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.layout_userNameInput.layout_main.snp.remakeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-keyboardHeight + 7)
        }
    }
    
    @objc func keyboardWillHide(_ sender: NSNotification) {
        self.layout_userNameInput.layout_main.transform = .identity
        self.layout_userNameInput.layout_main.snp.remakeConstraints() { make in
            make.center.equalToSuperview()
        }
    }

}
