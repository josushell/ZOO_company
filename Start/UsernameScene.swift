//
//  UsernameScene.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/06/23.
//

import Foundation
import SpriteKit
import UIKit

// MARK: user name input
class UsernameScene: SKScene {
    let textureAtlas = SKTextureAtlas(named: "start")
    
    var alert: UIAlertController!
    
    // MARK: - entry point
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255)
        
        // MARK: 배경 이미지 설정
        let backgroundImg = SKSpriteNode(imageNamed: "1")
        self.addChild(backgroundImg)
        
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
        
        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - button completion handler
    func btnHandler(alert: UIAlertAction)
    {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            appdel.name = self.alert.textFields?[0].text ?? "anonymous"
        }
        self.view?.window?.rootViewController?.dissmissAndPresent(Ch1Part1ViewController(), animated: true, completion: nil)
        //self.view?.presentScene(HomeScene(size: self.size), transition: .fade(withDuration: 2))
    }
}
