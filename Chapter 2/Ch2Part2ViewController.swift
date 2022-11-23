//
//  Ch2Part2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch2Part2ViewController: BaseViewController {
    var selected: [Bool] = [false, false]
    var selected_count = 0
    var imgArray: [UIImage] = [UIImage(named: "office_on_1")!, UIImage(named: "office_on_2")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = Ch2_part2()
        (sound as! Ch2_part2).playHomeMusic()
        
        layout = layout_Office_ch2_part2()
        
        layout.choices = ChoiceData_Ch2_part2()
        layout.profileOrder = ImgOrderData_Ch2_part2()
        layout.talks = TalkData_Ch2_part2()
        layout.response = Response_Ch2_part2()
        (layout as! layout_Office_ch2_part2).initView(self.view)
        
        layout.backgroundImg.animationImages = imgArray
        layout.backgroundImg.animationDuration = 0.3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.layout.backgroundImg.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.registerGesture()
        }
    }
    
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        
        layout.backView.isUserInteractionEnabled = false
        
        if (selected_count == 0) {
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])
  
            if (select_index == 0) {
                selectedStats = GameStats.Diligent.rawValue
            }
            else if (select_index == 1) {
                selectedStats = GameStats.Mental.rawValue
            }
            else {
                selectedStats = GameStats.Efficiency.rawValue
            }
        }
    
        else {
            if (select_index == 0) {
                self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch2_part2).char_image[self.selected_count][self.select_index])
                self.layout.text_nametag.text = "펭귄 대리"
            }
            else if (select_index == 1) {
                self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch2_part2).char_image[self.selected_count][self.select_index])
                self.layout.text_nametag.text = "뱁새 과장"
            }
            else {
                self.layout.profile_char.isHidden = true
                self.layout.img_nametag.isHidden = true
            }
            self.layout.profile_player.image = UIImage(named: self.layout.response.player_image[self.selected_count][self.select_index])
            self.layout.text.setText(self.layout.response.player_response[self.selected_count][self.select_index])

            if (select_index == 0) {
                selectedStats = GameStats.Relationship.rawValue
            }
            else if (select_index == 1) {
                selectedStats = GameStats.Efficiency.rawValue
            }
            else {
                selectedStats = GameStats.Mental.rawValue
            }
        }
        updateStat()
        
        selected[selected_count] = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    @objc override func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        if (!selected[0] && selected_count == 0) {
            self.layout.backgroundImg.stopAnimating()
            self.layout.backgroundImg.image = UIImage(named: "office_alpaca_fire")

            if (self.layout.talkIndex[0] < (layout.talks as! TalkData_Ch2_part2).alpaca.count) {
                self.layout.profile_char.isHidden = false
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "알파카 대리"
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch2_part2).alpaca[self.layout.talkIndex[0]])
                self.layout.text.setText((layout.talks as! TalkData_Ch2_part2).alpaca[self.layout.talkIndex[0]])
                self.layout.talkIndex[0] += 1
            }

            else if (self.layout.talkIndex[1] < 2) {
                self.layout.profile_player.isHidden = false
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                self.layout.talkIndex[1] += 1
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        else if (selected[0] == true  && selected_count == 0) {
            self.layout.img_nametag.isHidden = false
            self.layout.text_nametag.text = "알파카 대리"
            self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch2_part2).char_image[0][self.select_index])
            self.layout.text.setText((self.layout.response as! Response_Ch2_part2).alpaca_response[0][self.select_index])
            
            selected_count += 1
            
            layout.backView.isUserInteractionEnabled = true
        }
        
        else if (!selected[1] && selected_count == 1) {

            if (self.layout.talkIndex[1] < 3) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                self.layout.talkIndex[1] += 1
            }

            else if (self.layout.talkIndex[2] < 1) {
                self.layout.img_nametag.isHidden = false
                
                self.layout.text_nametag.text = "사자 부장"
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch2_part2).lion[self.layout.talkIndex[2]])
                self.layout.text.setText((layout.talks as! TalkData_Ch2_part2).lion[self.layout.talkIndex[2]])
                self.layout.talkIndex[2] += 1
            }
            
            else if (self.layout.talkIndex[1] < layout.talks.player.count) {
                self.layout.img_nametag.isHidden = true
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[1]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[1]])
                self.layout.talkIndex[1] += 1
            }
            
            else if (self.layout.talkIndex[3] < (layout.talks as! TalkData_Ch2_part2).anonymous.count) {
                self.layout.img_nametag.isHidden = false
                self.layout.text_nametag.text = "???"
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch2_part2).anonymous[(layout as! layout_Office_ch2_part2).talkIndex[3]])
                self.layout.text.setText((layout.talks as! TalkData_Ch2_part2).anonymous[(layout as! layout_Office_ch2_part2).talkIndex[3]])
                self.layout.talkIndex[3] += 1
            }
            else {
                self.layout.label_choicetitle.text = layout.choices.title[selected_count]
                self.layout.label_btn1.text = layout.choices.choice1[selected_count]
                self.layout.label_btn2.text = layout.choices.choice2[selected_count]
                self.layout.label_btn3.text = layout.choices.choice3[selected_count]
                (self.layout as! layout_Office_ch2_part2).updateLayout()
                
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
            layout.backView.isUserInteractionEnabled = true
        }

        else {
            self.layout.text.setText((layout.talks as! TalkData_Ch2_part2).final[self.select_index])
            
            (sound as! Ch2_part2).setVolumeFadeOut((sound as! Ch2_part2).bgm, completion: {
                self.presentFull(Ch3Part1ViewController(), animated: false, completion: nil)
            })
        }
    }

}
