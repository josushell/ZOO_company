//
//  Ch2OfficeLayout.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit
import SnapKit

// MARK: - 사무실 layout 1
class layout_Office_ch2_part1 {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let profile_char = UIImageView()
    
    let minimi_player = UIImageView()
    let minimi_lion = UIImageView()
    let minimi_mouse = UIImageView()
    let minimi_response = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    let img_nametag = UIImageView()
    let text_nametag = UILabel()
    
    let talks = TalkData_Ch2_part1()
    let profileOrder = ImgOrderData_Ch2_part1()
    var talkIndex: [Int] = [0, 0, 0]
    
    let layout_choice = UIView()
    let choiceView = UIImageView()
    let layout_blackView = UIView()
    let label_choicetitle = UILabel()
    let btn_choice1 = UIButton()
    let btn_choice2 = UIButton()
    let btn_choice3 = UIButton()
    let choices = ChoiceData_Ch2_part1()
    let response = Response_Ch2_part1()
    
    func initView(_ view: UIView) {
        print("init views")
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
        backgroundImg.image = UIImage(named: "office_off")
        
        
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
        
        textbox.addSubviews(text, img_nametag)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
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
        img_nametag.layer.zPosition = 998
        
        img_nametag.addSubview(text_nametag)
        text_nametag.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        text_nametag.setNameTagText()
        
        // profile 설정
        view.addSubviews(profile_player, profile_char)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "suit_normal")
        profile_player.isHidden = true
        
        profile_char.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.right.equalToSuperview().offset(-111)
        }
        profile_char.isHidden = true
        
        // minimi 설정
        view.addSubviews(minimi_player, minimi_lion, minimi_mouse, minimi_response)
        minimi_player.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(81)
            make.centerX.equalTo(backgroundImg.snp.centerX)
        }
        minimi_player.image = UIImage(named: "minimi_player_suit")
        
        minimi_lion.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_lion.image = UIImage(named: "minimi_lion_front")
        minimi_lion.isHidden = true
        
        minimi_mouse.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(26)
            make.leading.equalTo(backgroundImg.snp.leading).offset(240)
        }
        minimi_mouse.image = UIImage(named: "minimi_mouse_front")
        minimi_mouse.isHidden = true
        
        minimi_response.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top).offset(68)
            make.leading.equalTo(backgroundImg.snp.leading).offset(440)
        }
        minimi_response.isHidden = true
        
        // 선택지
        view.addSubviews(layout_choice, layout_blackView)
        layout_choice.snp.makeConstraints() { make in
            make.top.equalTo(backgroundImg.snp.top)
            make.width.equalTo(480)
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


// MARK: - 사무실 layout 2
class layout_Office_ch2_part2 {
    let vs = viewSize()
    
    let backView = UIView()
    let backgroundImg = UIImageView()
    let profile_player = UIImageView()
    let profile_char = UIImageView()
    
    let textbox = UIImageView()
    let text = UILabel()
    let img_nametag = UIImageView()
    let text_nametag = UILabel()
    
    let talks = TalkData_Ch2_part2()
    let profileOrder = ImgOrderData_Ch2_part2()
    // [알파카, 주인공, 사자, 신원불명]
    var talkIndex: [Int] = [0, 0, 0, 0]
    
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
    let choices = ChoiceData_Ch2_part2()
    let response = Response_Ch2_part2()
    
    func initView(_ view: UIView) {
        print("init views")
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
        backgroundImg.image = UIImage(named: "office_on_1")
        
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
        
        textbox.addSubviews(text, img_nametag)
        text.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
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
        img_nametag.layer.zPosition = 998
        
        img_nametag.addSubview(text_nametag)
        text_nametag.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        text_nametag.setNameTagText()
        
        // profile 설정
        view.addSubviews(profile_player, profile_char)
        profile_player.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.left.equalToSuperview().offset(111)
        }
        profile_player.image = UIImage(named: "suit_normal")
        profile_player.isHidden = true
        
        profile_char.snp.makeConstraints() { make in
            make.bottom.equalTo(self.textbox.snp.top)
            make.right.equalToSuperview().offset(-111)
        }
        profile_char.isHidden = true
        
        // 선택지
        view.addSubviews(layout_choice, layout_blackView)
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
        label_choicetitle.setChoiceText(choices.title[0], 14, 4, isTitle: true)
        
        btn_choice1.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(72)
        }
        btn_choice1.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice1.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice1.tag = 0
        
        btn_choice1.addSubview(label_btn1)
        label_btn1.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn1.setChoiceText(choices.choice1[0], 12)
        
        btn_choice2.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice1.snp.bottom).offset(10)
        }
        btn_choice2.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice2.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice2.tag = 1
        
        btn_choice2.addSubview(label_btn2)
        label_btn2.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn2.setChoiceText(choices.choice2[0], 12)
        
        btn_choice3.snp.makeConstraints() { make in
            make.width.equalTo(329)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(btn_choice2.snp.bottom).offset(10)
        }
        btn_choice3.setImage(UIImage(named: "choicebox_normal"), for: .normal)
        btn_choice3.setImage(UIImage(named: "choicebox_touched"), for: .focused)
        btn_choice3.tag = 2
        
        btn_choice3.addSubview(label_btn3)
        label_btn3.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        label_btn3.setChoiceText(choices.choice3[0], 12)
        
    }
}
