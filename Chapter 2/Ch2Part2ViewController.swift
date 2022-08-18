//
//  Ch2Part2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch2Part2ViewController: UIViewController {

    let layout = layout_Office_ch2_part2()
    var selected: [Bool] = [false, false]
    var selected_count = 0
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    var imgArray: [UIImage] = [UIImage(named: "office_on_1")!, UIImage(named: "office_on_2")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initView(self.view)
        layout.backgroundImg.animationImages = imgArray
        layout.backgroundImg.animationDuration = 0.3
        
        self.layout.backgroundImg.startAnimating()
        // 0.5초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.registerGesture()
        }
    }
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched(_:)))
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
        
        // 1번
        if (selected_count == 0) {
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])
        }
        
        // 2번
        else {
            self.layout.profile_char.image = UIImage(named: self.layout.response.char_image[self.selected_count][self.select_index])
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])
            
            if (select_index == 0) {
                self.layout.text_nametag.text = "펭귄 대리"
            }
            else if (select_index == 1) {
                self.layout.text_nametag.text = "뱁새 과장"
            }
            else {
                self.layout.img_nametag.isHidden = true
            }
        }
        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 1번
        if (!selected[0] && selected_count == 0) {
            self.layout.backgroundImg.stopAnimating()
            self.layout.backgroundImg.image = UIImage(named: "office_alpaca_fire")
            // 알파카
            if (layout.talkIndex[0] < layout.talks.alpaca.count) {
                self.layout.profile_char.isHidden = false
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "알파카 대리"
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.alpaca[layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.alpaca[layout.talkIndex[0]])
                layout.talkIndex[0] += 1
            }
            // 주인공
            else if (layout.talkIndex[1] < 2) {
                self.layout.profile_player.isHidden = false
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 1번 선택지 이후
        else if (selected[0] == true  && selected_count == 0) {
            self.layout.img_nametag.isHidden = false
            self.layout.text_nametag.text = "알파카 대리"
            self.layout.profile_char.image = UIImage(named: self.layout.response.char_image[0][self.select_index])
            self.layout.text.setText(self.layout.response.alpaca_response[0][self.select_index])
            
            selected_count += 1
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 2번
        else if (!selected[1] && selected_count == 1) {
            // 주인공
            if (layout.talkIndex[1] < 3) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            // 사자 부장
            else if (layout.talkIndex[2] < 1) {
                self.layout.img_nametag.isHidden = false
                
                self.layout.text_nametag.text = "사자 부장"
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.lion[layout.talkIndex[2]])
                self.layout.text.setText(layout.talks.lion[layout.talkIndex[2]])
                layout.talkIndex[2] += 1
            }
            
            // 주인공
            else if (layout.talkIndex[1] < layout.talks.player.count) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[layout.talkIndex[1]])
                layout.talkIndex[1] += 1
            }
            
            // 신원불명
            else if (layout.talkIndex[3] < layout.talks.anonymous.count) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "???"
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.profile_char.image = UIImage(named: layout.profileOrder.anonymous[layout.talkIndex[3]])
                self.layout.text.setText(layout.talks.anonymous[layout.talkIndex[3]])
                layout.talkIndex[3] += 1
            }
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
            self.layout.text.setText(layout.talks.final[self.select_index])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.presentFull(Ch3Part1ViewController(), animated: true, completion: nil)
            })
        }
    }

}
