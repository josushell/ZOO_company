//
//  Subway.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/07/09.
//

import Foundation
import SpriteKit
import SnapKit


class SubwayScene: SKScene {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile = UIImageView()
    let textbox = UIButton()
    let text = UILabel()
    
    let choice = UIImageView()
    let talks = ["휴…. 다행히 제 시간에 탔네 제 시간에 내리기만 하면 늦진 않겠어!",
                 "이번 역은 주 컴퍼니역입니다. 내리실 문은 왼쪽입니다",
                 "벌써 도착이잖아!",
                 "내려야 하는데… 사람이 왜 이리 많은거냐고!",
                 "안돼 첫 날부터 늦을 순 없어! 어떻게든 여기서 나가야만 해!"]
    var talkIndex: Int = 0
    
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFit
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0)
        
        setBackground()
        setDialog()
        setProfile()
        
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
        profile.image = UIImage(named: "suit-1")
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
        textbox.setBackgroundImage(UIImage(named: "textbacks"), for: .normal)
        textbox.setImage(UIImage(named: "textbacks"), for: .normal)
        textbox.isUserInteractionEnabled = false
        textbox.isHidden = true
        textbox.addTarget(self, action: #selector(textboxTouched), for: .touchUpInside)
        
        textbox.addSubview(text)
        text.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(18)
            make.left.equalToSuperview().offset(32)
        }
        text.numberOfLines = 0
        text.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        text.textColor = UIColor.white
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        print("tap")
        
        textbox.isHidden = false
        profile.isHidden = false
        
        if (choice.isHidden == true) {
            self.text.text = talks[talkIndex]
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
