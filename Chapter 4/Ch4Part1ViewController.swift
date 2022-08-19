//
//  Ch4Part1ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch4Part1ViewController: UIViewController {
    
    let layout = layout_Office_ch4()
    var selected: [Bool] = [false, false]
    var selected_count = 0
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.talks = TalkData_Ch4_part1()
        layout.choices = ChoiceData_Ch4_part1()
        layout.profileOrder = ImgOrderData_Ch4_part1()
        layout.response = Response_Ch4_part1()
        layout.initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.registerGesture()
        })
        
    }
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched))
        layout.backView.addGestureRecognizer(tapGesture!)
        
        layout.btn_choice1.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice2.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice3.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
    }
    
    @objc func onBtnClicked(_ sender: UIButton) {
        layout.backView.isUserInteractionEnabled = false
        layout.layout_blackView.isHidden = true
        select_index = sender.tag
        layout.layout_choice.isHidden = true

        // 1번 질문
        if (selected_count == 0) {
            self.layout.profile_player.image = UIImage(named: "suit_normal")
            self.layout.img_nametag.isHidden = false
            self.layout.profile_char.image = UIImage(named: (layout.response as! Response_Ch4_part1).char_image[0][self.select_index])
            self.layout.text.setText((layout.response as! Response_Ch4_part1).bat_response[0][self.select_index])
        }
        
        // 2번 질문
        else {
            self.layout.img_nametag.isHidden = true
            self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
            self.layout.text.setText(layout.response.player_response[0][self.select_index])
        }
        
        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 1번 선택지 이전
        if (!selected[0] && selected_count == 0) {
            // 박쥐
            if (layout.talkIndex[1] < 1) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "박쥐 이사"
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part1).bat[layout.talkIndex[1]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part1).bat[layout.talkIndex[1]])
                
                layout.talkIndex[1] += 1
            }
            
            // 주인공
            else if (layout.talkIndex[0] < 2) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                
                layout.talkIndex[0] += 1
            }

            // 선택지
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 1번 선택지 이후
        else if (selected[0] == true  && selected_count == 0) {
            
            // 주인공
            if (layout.talkIndex[0] < 4) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                
                if (layout.talkIndex[0] == 3) {
                    self.layout.profile_char.isHidden = true
                }
                
                self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                layout.talkIndex[0] += 1
            }

            else {
                // 미니미 애니메이션
                selected_count += 1
            }
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 2번 선택지 이전
        else if (!selected[1] && selected_count == 1) {
            // 땃쥐
            if (layout.talkIndex[2] < (layout.talks as! TalkData_Ch4_part1).mouse.count) {
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "땃쥐 사원"
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part1).mouse[layout.talkIndex[2]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part1).mouse[layout.talkIndex[2]])
                
                layout.talkIndex[2] += 1
            }
            // 주인공
            else if (layout.talkIndex[0] < layout.talks.player.count) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                
                layout.talkIndex[0] += 1
            }
            // 선택지
            else {
                self.layout.label_choicetitle.text = layout.choices.title[selected_count]
                self.layout.label_btn1.text = layout.choices.choice1[selected_count]
                self.layout.label_btn2.text = layout.choices.choice2[selected_count]
                self.layout.label_btn3.text = layout.choices.choice3[selected_count]
                
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 2번 선택지 이후
        else {
            //MARK: - fade in fade out
            self.presentFull(Ch4Part2ViewController(), animated: false, completion: nil)
        }
        
    }
        

}
