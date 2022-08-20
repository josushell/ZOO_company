//
//  Ch3Part1ViewController.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import UIKit

class Ch3Part1ViewController: BaseViewController {

    var selected: [Bool] = [false, false]
    var selected_count = 0
    var minimi_lion: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_Office_ch3()
        
        layout.profileOrder = ImgOrderData_Ch3_part1()
        layout.choices = ChoiceData_Ch3_part1()
        layout.talks = TalkData_Ch3_part1()
        layout.response = Response_Ch3_part1()
        
        (layout as! layout_Office_ch3).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.registerGesture()
        })
        
    }

    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        layout.backView.isUserInteractionEnabled = false
        
        self.layout.img_nametag.isHidden = true
        self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
        self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])

        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 1번 선택지 이전
        if (!selected[0] && selected_count == 0) {
            // 주인공
            if ((layout as! layout_Office_ch3).talkIndex[0] < 1) {
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch3).talkIndex[0]])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch3).talkIndex[0]])
                
                (layout as! layout_Office_ch3).talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 사자
            else if ((layout as! layout_Office_ch3).talkIndex[1] < (layout.talks as! TalkData_Ch3_part1).lion.count) {
                
                if (!minimi_lion) {
                    lionMinimiAnimation_IN()
                }
                else {
                    self.layout.revealAfterAnim()
                    self.layout.profile_player.image = UIImage(named: "suit_normal")
                    self.layout.img_nametag.isHidden = false
                    self.layout.text_nametag.text = "사자 부장"
                    self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch3_part1).lion[(layout as! layout_Office_ch3).talkIndex[1]])
                    self.layout.text.setText((layout.talks as! TalkData_Ch3_part1).lion[(layout as! layout_Office_ch3).talkIndex[1]])
                    
                    (layout as! layout_Office_ch3).talkIndex[1] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
            }
            
            // 주인공
            else if ((layout as! layout_Office_ch3).talkIndex[0] < 2) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch3).talkIndex[0]])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch3).talkIndex[0]])
                
                (layout as! layout_Office_ch3).talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 선택지
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
        }
        
        // 1번 선택지 이후
        else if (selected[0] == true  && selected_count == 0) {
            // 사자
            if ((layout as! layout_Office_ch3).talkIndex[0] < 3) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "사자 부장"
                self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch3_part1).char_image[0][self.select_index])
                self.layout.text.setText((layout.response as! Response_Ch3_part1).lion_response[self.select_index])
                
                (layout as! layout_Office_ch3).talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 주인공
            else {
                lionMinimiAnimation_OUT()
                
                self.layout.profile_char.isHidden = true
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch3).talkIndex[0] - 1])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch3).talkIndex[0] - 1])
                
                selected_count += 1
                layout.backView.isUserInteractionEnabled = true
            }
        }
        
        // 2번 선택지 이전
        else if (!selected[1] && selected_count == 1) {
            // 주인공
            if ((layout as! layout_Office_ch3).talkIndex[0] < layout.talks.player.count) {
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[(layout as! layout_Office_ch3).talkIndex[0]])
                self.layout.text.setText(layout.talks.player[(layout as! layout_Office_ch3).talkIndex[0]])
                
                (layout as! layout_Office_ch3).talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
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
        }
        
        // 2번 선택지 이후
        else {
            //MARK: - fade in fade out
            self.presentFull(Ch3Part2ViewController(), animated: false, completion: nil)
        }
    }
    
    // 사자 minimi in
    func lionMinimiAnimation_IN() {
        (self.layout as! layout_Office_ch3).minimi_lion.isHidden = false
        self.layout.backView.isUserInteractionEnabled = false
        self.layout.hideBeforeAnim()
        
        UIView.animate(withDuration: 1.3, delay: 0, options: .curveLinear, animations: {
            (self.layout as! layout_Office_ch3).minimi_lion.transform = CGAffineTransform(translationX: 0, y: 130)
        }, completion: { _ in
            self.layout.backView.isUserInteractionEnabled = true
            self.minimi_lion = true
        })
    }
    
    // 사자 minimi out
    func lionMinimiAnimation_OUT() {
        UIView.animate(withDuration: 1.3, delay: 0, options: .curveLinear, animations: {
            (self.layout as! layout_Office_ch3).minimi_lion.transform = CGAffineTransform(translationX: 0, y: -20)
        }, completion: { _ in
            (self.layout as! layout_Office_ch3).minimi_lion.removeFromSuperview()
        })
    }

}
