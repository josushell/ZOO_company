//
//  Ch1HomeLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit
import SnapKit

// MARK: - home layout
class layout_home {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let minimi_player = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    
    let talks = TalkData_Ch1()
    let profileOrder = ImgOrderData_Ch1()
    var talkIndex: [Int] = [0, 0, 0]
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let layout_blackView = UIView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let choices = ChoiceData_Ch1()
    let response = Response_Ch1()
    
    func initView(_ view: UIView) {
        talks.initTalks()
        
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
        backgroundImg.image = UIImage(named: "home")
        
        
        // text box
        view.addSubview(textbox)
        textbox.snp.makeConstraints() { make in
            make.bottom.centerX.equalTo(backgroundImg)
            make.height.equalTo(74)
            make.width.equalTo(backgroundImg.snp.width)
        }
        textbox.image = UIImage(named: "textback")
        textbox.isHidden = true
        textbox.layer.zPosition = 998
        
        textbox.addSubviews(text)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
        text.setTextAttribute()
        text.preferredMaxLayoutWidth = self.textbox.frame.width
        
        // profile 설정
        view.addSubviews(profile_player, minimi_player)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.width.equalTo(90)
            make.height.equalTo(133)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "sleep_normal")
        profile_player.isHidden = true
        
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(71)
            make.trailing.equalTo(backgroundImg.snp.trailing).offset(-176)
        }
        minimi_player.image = UIImage(named: "minimi_player_sleep")
        
        // 선택지
        view.addSubviews(layout_choice,layout_blackView)
        layout_choice.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top)
            make.width.equalTo(445)
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
        
        layout_choice.addSubviews(choiceView, label_choicetitle, btn_choice1, btn_choice2, btn_choice3)
        choiceView.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        choiceView.image = UIImage(named: "choiceframe")
        
        label_choicetitle.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(36)
            make.centerX.equalToSuperview()
        }
        label_choicetitle.setChoiceText(choices.title, 14, 4, isTitle: true)
        
        btn_choice1.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(72)
        }
        btn_choice1.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice1.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice1.tag = 0
        
        let label_btn1 = UILabel()
        btn_choice1.addSubview(label_btn1)
        label_btn1.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn1.setChoiceText(choices.choice1, 12)
        
        btn_choice2.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.bottom).offset(10)
        }
        btn_choice2.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice2.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice2.tag = 1
        
        let label_btn2 = UILabel()
        btn_choice2.addSubview(label_btn2)
        label_btn2.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn2.setChoiceText(choices.choice2, 12)
        
        btn_choice3.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice2.snp.bottom).offset(10)
        }
        btn_choice3.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice3.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice3.tag = 2
        
        let label_btn3 = UILabel()
        btn_choice3.addSubview(label_btn3)
        label_btn3.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn3.setChoiceText(choices.choice3, 12)
    }
}
