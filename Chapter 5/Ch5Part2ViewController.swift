//
//  Ch5Part2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/09/02.
//

import Foundation
import UIKit

class Ch5Part2ViewController: BaseViewController {
    var selected: [Bool] = [false, false]
    var selected_count = 0
    var response_pigeon: Bool = false
    var response_alpaca: Bool = false
    let ImgArray = [UIImage(named: "presentation_hands1")!, UIImage(named: "presentation_hands2")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_Presentation_ch5()
        
        layout.talks = TalkData_Ch5_part2()
        layout.choices = ChoiceData_Ch5_part2()
        layout.profileOrder = ImgOrderData_Ch5_part2()
        layout.response = Response_Ch5_part2()
        (layout as! layout_Presentation_ch5).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.registerGesture()
        })
        
        layout.backgroundImg.animationImages = ImgArray
        layout.backgroundImg.animationDuration = 0.6
    }
    
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        layout.backView.isUserInteractionEnabled = false
        
        self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
        self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])

        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    override func backTouched(_ sender: UITapGestureRecognizer) {
        self.layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        
        if (!selected[0] && selected_count == 0) {
            // 펭귄(or 땃쥐)
            if (self.layout.talkIndex[0] < (layout.talks as! TalkData_Ch5_part2).penguin.count) {
                self.layout.setNametag(nametagHidden: false, "펭귄 대리")
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch5_part2).penguin[self.layout.talkIndex[0]])
                self.layout.text.setText((layout.talks as! TalkData_Ch5_part2).penguin[self.layout.talkIndex[0]])
                
                self.layout.talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 주인공
            else if (self.layout.talkIndex[1] < 3) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_char.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                
                if (self.layout.talkIndex[1] == 1) {
                    // ToDo: 발표하는 이미지로 변경 (시간 두고 변경)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        UIView.transition(with: self.layout.backgroundImg, duration: 2, options: .transitionCrossDissolve, animations: {
                            self.layout.backgroundImg.image = UIImage(named: "presentation_off")
                        }, completion: { _ in
                            self.layout.talkIndex[1] += 1
                            self.layout.backView.isUserInteractionEnabled = true
                        })
                    })
                }
                else {
                    self.layout.talkIndex[1] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
            }
            
            // 비둘기
            else if (self.layout.talkIndex[2] < (layout.talks as! TalkData_Ch5_part2).pigeon.count) {
                self.layout.setNametag(nametagHidden: false, "비둘기 사장")
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch5_part2).pigeon[self.layout.talkIndex[2]])
                self.layout.text.setText((layout.talks as! TalkData_Ch5_part2).pigeon[self.layout.talkIndex[2]])
                
                self.layout.talkIndex[2] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 주인공
            else if (self.layout.talkIndex[1] < 5) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_char.isHidden = true
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                
                self.layout.talkIndex[1] += 1
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
            // 비둘기
            if (!response_pigeon) {
                self.layout.setNametag(nametagHidden: false, "비둘기 사장")
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch5_part2).pigeon_image[self.select_index])
                self.layout.text.setText((layout.response as! Response_Ch5_part2).pigeon[self.select_index])
                
                response_pigeon = true
                layout.backView.isUserInteractionEnabled = true
            }
            
            // 주인공
            else {
                // alpaca 반응
                if (self.select_index == 1 && !response_alpaca) {
                    self.layout.setNametag(nametagHidden: false, "알파카 대리")
                    self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch5_part2).alpaca_image[0])
                    self.layout.text.setText((layout.response as! Response_Ch5_part2).alpaca[0])
                    
                    response_alpaca = true
                }
                else {
                    self.layout.profile_char.isHidden = true
                    self.layout.img_nametag.isHidden = true
                    self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index + 3])
                    self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index + 3])
                    
                    selected_count += 1
                }
                layout.backView.isUserInteractionEnabled = true
            }
        }
        
        // 2번 선택지 이전
        else if (!selected[1] && selected_count == 1) {
            // 주인공
            if (self.layout.talkIndex[1] < layout.talks.player.count) {
                if (self.layout.talkIndex[1] == 6) {
                    self.layout.backgroundImg.image = UIImage(named: "presentation_endon")
                }
                else {
                    self.layout.backgroundImg.image = UIImage(named: "presentation_endoff")
                }
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                
                if (self.layout.talkIndex[1] == 6) {
                    self.layout.backgroundImg.startAnimating()
                }
                
                self.layout.talkIndex[1] += 1
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
            self.layout.backgroundImg.stopAnimating()
            self.layout.backgroundImg.image = UIImage(named: "presentation_endon")
            self.layout.profile_char.isHidden = false
            self.layout.profile_char.image = UIImage(named: (layout.response as! Response_Ch5_part2).char_image[self.select_index])
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index + 3])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index + 3])
            
            //MARK: - fade in fade out
            //self.dissmissAndPresent(Ending(), animated: false, completion: nil)
        }
    }
}
