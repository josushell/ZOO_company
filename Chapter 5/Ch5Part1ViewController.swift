//
//  Ch5Part1ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/26.
//

import UIKit

// MARK: - Ch5Part1ViewController
class Ch5Part1ViewController: BaseViewController {
    var selected: Bool = false
    let mailImgArray = [UIImage(named: "mail")!, UIImage(named: "mailpoint")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = Ch5_part1()
        (sound as! Ch5_part1).playHomeMusic()
        
        layout = layout_Mail_ch5()
        
        layout.talks = TalkData_Ch5_part1()
        layout.choices = ChoiceData_Ch5_part1()
        layout.profileOrder = ImgOrderData_Ch5_part1()
        layout.response = Response_Ch5_part1()
        (layout as! layout_Mail_ch5).initView(self.view)
        
        (layout as! layout_Mail_ch5).mailIconGesture = UITapGestureRecognizer(target: self, action: #selector(mailIconTouched))
        (layout as! layout_Mail_ch5).mailIcon.addGestureRecognizer((layout as! layout_Mail_ch5).mailIconGesture!)
        
        (layout as! layout_Mail_ch5).mailScreenGesture = UITapGestureRecognizer(target: self, action: #selector(mailScreenTouched))
        (layout as! layout_Mail_ch5).mailScreen.layout_main.addGestureRecognizer((layout as! layout_Mail_ch5).mailScreenGesture!)

        (self.layout as! layout_Mail_ch5).mailIcon.animationImages = mailImgArray
        (self.layout as! layout_Mail_ch5).mailIcon.animationDuration = 0.7
        
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
        
        // 엔딩 스탯 추가
        if (select_index == 0) {
            selectedStats = GameStats.Efficiency.rawValue
        }
        else if (select_index == 1) {
            selectedStats = GameStats.Mental.rawValue
        }
        else {
            selectedStats = GameStats.Diligent.rawValue
        }
        
        updateStat()
    }
    
    override func backTouched(_ sender: UITapGestureRecognizer) {
        self.layout.backView.isUserInteractionEnabled = false
        layout.textbox.isHidden = false
        
        if (!selected) {
            if (self.layout.talkIndex[0] < 7) {
                self.layout.profile_player.isHidden = false
                self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
                self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
                
                if (self.layout.talkIndex[0] == 1) {
                    (self.layout as! layout_Mail_ch5).showMailAnimation({
                        self.layout.talkIndex[0] += 1
                        self.layout.backView.isUserInteractionEnabled = true
                    })
                }
                
                else if (self.layout.talkIndex[0] == 2) {
                    (layout as! layout_Mail_ch5).mailIcon.isUserInteractionEnabled = true
                    (self.layout as! layout_Mail_ch5).mailIcon.startAnimating()
                }
                else {
                    self.layout.talkIndex[0] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
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
                    sound.setVolumeFadeOut((sound as! Ch5_part1).bgm, completion: {
                        self.dissmissAndPresent(Ch5Part2ViewController(), animated: false, completion: nil)
                    })
                    //self.dissmissAndPresent(Ch5Part2ViewController(), animated: false, completion: nil)
                }
            }
        }
    }
}

// MARK: - Mail Event
extension Ch5Part1ViewController {
    // Mail Icon Touch Gesture Method
    @objc func mailIconTouched(_ sender: UITapGestureRecognizer) {
        (layout as! layout_Mail_ch5).mailIcon.stopAnimating()
        layout.hideBeforeAnim()
        layout.layout_blackView.isHidden = false
        (layout as! layout_Mail_ch5).mailIcon.removeFromSuperview()
        (layout as! layout_Mail_ch5).mailScreen.layout_main.isHidden = false
    }
    
    // Mail Screen Touch Gesture Method
    @objc func mailScreenTouched(_ sender: UITapGestureRecognizer) {
        self.layout.layout_blackView.isHidden = true
        (layout as! layout_Mail_ch5).mailScreen.layout_main.removeFromSuperview()
        
        self.layout.talkIndex[0] += 1
        
        self.layout.profile_player.isHidden = false
        layout.textbox.isHidden = false
        self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[self.layout.talkIndex[0]])
        self.layout.text.setText(layout.talks.player[self.layout.talkIndex[0]])
        
        self.layout.talkIndex[0] += 1
        self.layout.backView.isUserInteractionEnabled = true
        
    }
    
}
