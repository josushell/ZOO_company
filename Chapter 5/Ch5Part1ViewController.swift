//
//  Ch5Part1ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/26.
//

import UIKit

class Ch5Part1ViewController: BaseViewController {
    var selected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = layout_Mail_ch5()
        
        layout.talks = TalkData_Ch5_part1()
        layout.choices = ChoiceData_Ch5_part1()
        layout.profileOrder = ImgOrderData_Ch5_part1()
        layout.response = Response_Ch5_part1()
        (layout as! layout_Mail_ch5).initView(self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.registerGesture()
        })
    }
    @objc override func onBtnClicked(_ sender: UIButton) {
        super.onBtnClicked(sender)
        
        layout.backView.isUserInteractionEnabled = false
        
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        
        selected = true
        layout.backView.isUserInteractionEnabled = true
    }
    
    override func backTouched(_ sender: UITapGestureRecognizer) {
        self.layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        
        if (!selected) {
            if (self.layout.talkIndex[0] < 7) {
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                
                self.layout.talkIndex[0] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            else {
                self.view.bringSubviewToFront(layout.layout_choice)
                layout.layout_choice.isHidden = false
                layout.layout_blackView.isHidden = false
            }
        }
        
        else {
            if (self.layout.talkIndex[1] < 1) {
                self.layout.setNametag(nametagHidden: false, "펭귄 대리")
                self.layout.profile_char.isHidden = false
                self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch5_part1).penguin[self.layout.talkIndex[1]])
                self.layout.profile_player.image = UIImage(named: "suit_normal")
                self.layout.text.setText((layout.talks as! TalkData_Ch5_part1).penguin[self.layout.talkIndex[1]])
                
                self.layout.talkIndex[1] += 1
                layout.backView.isUserInteractionEnabled = true
            }
            else {
                if (self.layout.talkIndex[0] < 9) {
                    if (self.layout.talkIndex[0] == 8) {
                        self.layout.profile_char.isHidden = true
                    }
                    self.layout.img_nametag.isHidden = true
                    self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                    self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                    
                    self.layout.talkIndex[0] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
                else {
                    //MARK: - ch5 part2 fade in fade out
                    //self.dissmissAndPresent(Ch5Part2ViewController(), animated: false, completion: nil)
                }
            }
        }
    }
}
