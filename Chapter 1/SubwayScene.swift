//
//  Subway.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import GameplayKit
import SpriteKit
import UIKit
import SnapKit


class SubwayScene: SKScene {
    let layout = layout_subway()
    
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile = UIImageView()
    let textbox = UIButton()
    let text = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    let choice = UIImageView()
    let talks = ["휴…. 다행히 제 시간에 탔네 제 시간에 내리기만 하면 늦진 않겠어!",
                 "이번 역은 주 컴퍼니역입니다. 내리실 문은 왼쪽입니다",
                 "벌써 도착이잖아!",
                 "내려야 하는데… 사람이 왜 이리 많은거냐고!",
                 "안돼 첫 날부터 늦을 순 없어! 어떻게든 여기서 나가야만 해!"]
    var talkIndex: Int = 0
    
    override func didMove(to view: SKView) {


        print("did move")
        layout.initView(self.view!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        layout.backView.addGestureRecognizer(tapGesture)
//        setBackground()
//        setDialog()
//        setProfile()
//
        self.choice.isHidden = true
    }
    
    func setProfile() {
        self.view?.addSubview(profile)
        profile.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.width.equalTo(90)
            make.height.equalTo(133)
            make.left.equalToSuperview().offset(111)
        }
        profile.image = UIImage(named: "suit_normal")
        profile.isHidden = true
        
    }
    func setBackground() {
        self.view?.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        
        backView.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        backgroundImg.frame.size = CGSize(width: vs.width, height: vs.height)
        backgroundImg.image = UIImage(named: "subway")
        
        // touch event
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
        backView.addGestureRecognizer(tapGesture)
    }
    
    func setDialog() {
        self.view?.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backView)
            make.height.equalTo(74)
            make.width.equalTo(760)
        }
        //textbox.setBackgroundImage(UIImage(named: "textbacks"), for: .normal)
        //textbox.imageView?.image = UIImage(named: "textbacks")
        let imgView = UIImageView(image: UIImage(named: "textbacks"))
        textbox.addSubview(imgView)
        imgView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        
        textbox.isHidden = true
        textbox.layer.zPosition = 998
        //textbox.addTarget(self, action: #selector(textboxTouched), for: .touchUpInside)
        //textbox.setImage(UIImage(named: "textback"), for: .normal)
        
//        textbox.addSubview(text)
//        text.snp.makeConstraints() { make in
//            make.top.equalToSuperview().offset(18)
//            make.left.equalToSuperview().offset(32)
//        }
//        text.numberOfLines = 0
//        text.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
//        text.textColor = UIColor.white
//        text.layer.zPosition = 999
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        print("tap")
        
//        textbox.isHidden = false
//        profile.isHidden = false
////
////        if (choice.isHidden == true) {
////            self.text.text = talks[talkIndex]
////        }
//
//        if (choice.isHidden == true) {
//            if (talkIndex < 4) {
//                talkIndex += 1
//                self.text.text = talks[talkIndex]
//            }
//            else {
//                choice.isHidden = false
//            }
//        }
        
        layout.textbox.isHidden = false
        layout.profile.isHidden = false
        
        if (layout.choice.isHidden == true) {
            if (layout.talkIndex < 4) {
                print("yes")
                layout.talkIndex += 1
                self.layout.text.text = layout.talks[layout.talkIndex]
                layout.text.position.x = 0.5//self.layout.textbox.layer.position.x - self.layout.text.frame.width / 2 + self.layout.text.frame.width / 2 + 32
            }
            else {
                self.view?.window?.rootViewController?.dissmissAndPresent(Ch2Part1ViewController(), animated: true, completion: nil)
                layout.choice.isHidden = false
            }
        }
    }
    
    @objc func textboxTouched(_ sender: UIButton) {
        print("button")
        
        if (choice.isHidden == true) {
            if (talkIndex < 4) {
                talkIndex += 1
                self.text.text = talks[talkIndex]
            }
            else {
                choice.isHidden = false
            }
        }
    }
    
}

class layout_subway {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile = UIImageView()
    let textbox = UIImageView()
    let text = SKLabelNode(fontNamed: "NeoDunggeunmo-Regular")
    
    let choice = UIImageView()
    let talks = ["휴…. 다행히 제 시간에 탔네 제 시간에 내리기만 하면 늦진 않겠어!",
                 "이번 역은 주 컴퍼니역입니다. 내리실 문은 왼쪽입니다",
                 "벌써 도착이잖아!",
                 "내려야 하는데… 사람이 왜 이리 많은거냐고!",
                 "안돼 첫 날부터 늦을 순 없어! 어떻게든 여기서 나가야만 해!"]
    var talkIndex: Int = 0
    
    func initView(_ view: SKView) {
        print("init views")
        choice.isHidden = true
        view.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        
        backView.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        backgroundImg.frame.size = CGSize(width: vs.width, height: vs.height)
        backgroundImg.image = UIImage(named: "subway")
        
        
        // text box
        view.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backView)
            make.height.equalTo(74)
            make.width.equalTo(760)
        }
        textbox.image = UIImage(named: "textback")
        textbox.isHidden = true
        textbox.layer.zPosition = 998
        
        view.scene?.addChild(text)
//        textbox.addSubview(<#T##view: UIView##UIView#>)
//        let textView = (text.inputView)! as UIView
//        textbox.addSubview(textView)
//        textView.snp.makeConstraints() { make in
//            make.top.equalToSuperview().offset(18)
//            make.left.equalToSuperview().offset(32)
//        }
        text.text = "test"
        text.position.y = 0.5//text.position.y - text.frame.height / 2
        text.numberOfLines = 0
        text.fontColor = UIColor.white
        text.fontSize = 15
        text.preferredMaxLayoutWidth = self.backgroundImg.frame.width - 64
        text.zPosition = 999
        
        
        view.addSubview(profile)
        profile.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.width.equalTo(90)
            make.height.equalTo(133)
            make.left.equalToSuperview().offset(111)
        }
        profile.image = UIImage(named: "suit_normal")
        profile.isHidden = true
    }
}
