//
//  Ch4Part1ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch4Part1ViewController: BaseViewController {
    var selected: [Bool] = [false, false]
    var selected_count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_Office_ch4()
        
        layout.talks = TalkData_Ch4_part1()
        layout.choices = ChoiceData_Ch4_part1()
        layout.profileOrder = ImgOrderData_Ch4_part1()
        layout.response = Response_Ch4_part1()
        (layout as! layout_Office_ch4).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            // 박쥐 animation
            (self.layout as! layout_Office_ch4).minimi_char1.isHidden = false
            UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear ,animations: {
                (self.layout as! layout_Office_ch4).minimi_char1.transform = CGAffineTransform(translationX: 0, y: 70)
            }, completion: { finished in
                self.registerGesture()
            })
        })
    }
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        
        layout.backView.isUserInteractionEnabled = false
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
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 1번 선택지 이전
        if (!selected[0] && selected_count == 0) {
            // 박쥐
            if ((layout as! layout_Office_ch4).talkIndex[1] < 1) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "박쥐 이사"
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part1).bat[(layout as! layout_Office_ch4).talkIndex[1]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part1).bat[(layout as! layout_Office_ch4).talkIndex[1]])
                
                (layout as! layout_Office_ch4).talkIndex[1] += 1
            }
            
            // 주인공
            else if ((layout as! layout_Office_ch4).talkIndex[0] < 2) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch4).talkIndex[0]])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch4).talkIndex[0]])
                
                (layout as! layout_Office_ch4).talkIndex[0] += 1
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
            if ((layout as! layout_Office_ch4).talkIndex[0] < 4) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch4).talkIndex[0]])
                
                if ((layout as! layout_Office_ch4).talkIndex[0] == 3) {
                    self.layout.profile_char.isHidden = true
                }
                
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch4).talkIndex[0]])
                (layout as! layout_Office_ch4).talkIndex[0] += 1
                
                layout.backView.isUserInteractionEnabled = true
            }

            else {
                // 미니미 애니메이션
                mouseMinimiAnimation_IN()
                selected_count += 1
            }
        }
        
        // 2번 선택지 이전
        else if (!selected[1] && selected_count == 1) {
            // 땃쥐
            if ((layout as! layout_Office_ch4).talkIndex[2] < (layout.talks as! TalkData_Ch4_part1).mouse.count) {
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "땃쥐 사원"
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch4_part1).mouse[(layout as! layout_Office_ch4).talkIndex[2]])
                self.layout.text.setText((layout.talks as! TalkData_Ch4_part1).mouse[(layout as! layout_Office_ch4).talkIndex[2]])
                
                (layout as! layout_Office_ch4).talkIndex[2] += 1
            }
            // 주인공
            else if ((layout as! layout_Office_ch4).talkIndex[0] < layout.talks.player.count) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch4).talkIndex[0]])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch4).talkIndex[0]])
                
                (layout as! layout_Office_ch4).talkIndex[0] += 1
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
    
    func batMinimiAnimation_IN() {
        
    }
    
    func mouseMinimiAnimation_IN() {
        self.layout.backView.isUserInteractionEnabled = false
        (self.layout as! layout_Office_ch4).minimi_char2.isHidden = false
        (self.layout as! layout_Office_ch4).hideBeforeAnim()
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear  ,animations: {
            (self.layout as! layout_Office_ch4).minimi_char2.transform = CGAffineTransform(translationX: 0, y: 60)
        }, completion: { _ in
            (self.layout as! layout_Office_ch4).minimi_char2.image = UIImage(named: "minimi_mouse_left")
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: {
                (self.layout as! layout_Office_ch4).minimi_char2.transform = CGAffineTransform(translationX: 55, y: 60)
            }, completion: { _ in
                (self.layout as! layout_Office_ch4).minimi_char2.image = UIImage(named: "minimi_mouse_front")
                self.layout.backView.isUserInteractionEnabled = true
            })
        })
    }
}
