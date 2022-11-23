//
//  Choice.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/15.
//

import Foundation
import UIKit
import SpriteKit

class layout_base {
    let vs = ViewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let profile_char = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    let img_nametag = UIImageView()
    let text_nametag = UILabel()
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let layout_blackView = UIView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let label_btn1 = UILabel()
    let label_btn2 = UILabel()
    let label_btn3 = UILabel()

    var talkIndex: [Int] = []
    var talks = TalkData()
    var profileOrder = ImgOrderData()
    var choices = ChoiceData()
    var response = Response()
    
    func initView(_ view: UIView, backImg: String, profileImg: String, choiceWidth: Int = 445) {
        view.addSubview(backView)
        backView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        backView.backgroundColor = .black
        
        view.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints() { make in
            make.center.equalToSuperview()
            make.height.equalTo(vs.height)
            make.width.equalTo(vs.width)
        }
        backgroundImg.frame.size = CGSize(width: vs.width, height: vs.height)
        backgroundImg.image = UIImage(named: backImg)
        
        view.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backgroundImg)
            make.height.equalTo(74)
            make.width.equalTo(backgroundImg.snp.width)
        }
        textbox.image = UIImage(named: "textback")
        textbox.isHidden = true
        textbox.layer.zPosition = Zposition.nametagNtextbox.rawValue
        
        textbox.addSubviews(text, img_nametag)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        text.setTextAttribute()
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        img_nametag.snp.makeConstraints() {make in
            make.width.equalTo(74)
            make.height.equalTo(17)
            make.bottom.equalTo(textbox.snp.top)
            make.right.equalToSuperview().offset(-49)
        }
        img_nametag.image = UIImage(named: "nametag")
        img_nametag.isHidden = true
        img_nametag.layer.zPosition = Zposition.nametagNtextbox.rawValue
        
        img_nametag.addSubview(text_nametag)
        text_nametag.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        text_nametag.setNameTagText()
        
        view.addSubviews(profile_player, profile_char)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: profileImg)
        profile_player.layer.zPosition = Zposition.profile.rawValue
        profile_player.isHidden = true
        
        profile_char.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.right.equalToSuperview().offset(-111)
        }
        profile_char.layer.zPosition = Zposition.profile.rawValue
        profile_char.isHidden = true
        
        view.addSubviews(layout_choice, layout_blackView)
        layout_choice.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top)
            make.width.equalTo(choiceWidth)
            make.bottom.equalTo(self.textbox.snp.top)
            make.centerX.equalToSuperview()
        }
        layout_choice.isHidden = true
        
        layout_blackView.snp.makeConstraints() { make in
            make.edges.equalTo(backgroundImg)
        }
        layout_blackView.backgroundColor = .black
        layout_blackView.alpha = 0.5
        layout_blackView.isHidden = true
        layout_blackView.layer.zPosition = Zposition.blackView.rawValue

        layout_choice.addSubviews(choiceView, label_choicetitle, btn_choice1, btn_choice2, btn_choice3)
        choiceView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        choiceView.image = UIImage(named: "choiceframe")
        layout_choice.layer.zPosition = Zposition.choice.rawValue
        
        label_choicetitle.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(36)
            make.centerX.equalToSuperview()
        }
        label_choicetitle.setChoiceText(choices.title[0], 14, 4, isTitle: true)
        
        let availableHeight = vs.height - 74 - label_choicetitle.frame.size.height - 36
        let btnOneHeight = availableHeight / 3 - 5
        
        btn_choice1.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(label_choicetitle.snp.bottom).offset(12)
        }
        
        btn_choice1.addSubview(label_btn1)
        label_btn1.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn1.setChoiceText(choices.choice1[0], 12)
        btn_choice1.setChoiceButton(tagValue: 0)
        
        btn_choice2.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.top).offset(btnOneHeight)
        }
        
        btn_choice2.addSubview(label_btn2)
        label_btn2.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn2.setChoiceText(choices.choice2[0], 12)
        btn_choice2.setChoiceButton(tagValue: 1)
        
        btn_choice3.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.top).offset(btnOneHeight * 2)
        }
        btn_choice3.addSubview(label_btn3)
        label_btn3.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn3.setChoiceText(choices.choice3[0], 12)
        btn_choice3.setChoiceButton(tagValue: 2)
    }
}

extension layout_base {
    func hideBeforeAnim() {
        self.textbox.isHidden = true
        self.profile_char.isHidden = true
        self.profile_player.isHidden = true
    }
    
    func revealAfterAnim() {
        self.textbox.isHidden = false
        self.profile_char.isHidden = false
        self.profile_player.isHidden = false
    }
    
    func setNametag(nametagHidden: Bool, _ text: String = "") {
        self.img_nametag.isHidden = nametagHidden
        if (!nametagHidden) {
            self.text_nametag.text = text
        }
    }
}
