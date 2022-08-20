//
//  Ch2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/07.
//

import UIKit
import SnapKit


class Ch2Part1ViewController: UIViewController {
    let layout = layout_Office_ch2_part1()
    var selected: Bool = false
    var minimi_lion: Bool = false
    var minimi_mouse: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    let sound = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        layout.talks = TalkData_Ch2_part1()
        layout.profileOrder = ImgOrderData_Ch2_part1()
        layout.choices = ChoiceData_Ch2_part1()
        layout.response = Response_Ch2_part1()
        layout.initView(self.view)
        
        // 3초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear ,animations: {
                self.layout.minimi_player.transform = CGAffineTransform(translationX: 0, y: 66)
            }, completion: { finished in
                self.registerGesture()
            })
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
        sound.playSelectSound()
        
        layout.layout_blackView.isHidden = true
        select_index = sender.tag
        selected = true
        layout.layout_choice.isHidden = true
        
        self.layout.backView.isUserInteractionEnabled = false
        self.layout.minimi_response.isHidden = false
        self.layout.minimi_response.image = UIImage(named: (self.layout.response as! Response_Ch2_part1).minimi_image[self.select_index])
        
        self.layout.hideBeforeAnim()
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear  ,animations: {
            self.layout.minimi_response.transform = CGAffineTransform(translationX: 0, y: 70)
        }, completion: { _ in
            self.layout.revealAfterAnim()
            self.layout.text_nametag.text = (self.layout.response as! Response_Ch2_part1).label_nametag[self.select_index]
            self.layout.profile_char.image = UIImage(named: (self.layout.response as! Response_Ch2_part1).char_image[self.select_index])
            self.layout.text.setText((self.layout.response as! Response_Ch2_part1).char_response[self.select_index])
            self.layout.backView.isUserInteractionEnabled = true
        })
        
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        layout.textbox.isHidden = false
        layout.profile_player.isHidden = false
        layout.backView.isUserInteractionEnabled = false
        
        // 선택지 전
        if (!selected){
            if (layout.layout_choice.isHidden == true) {
                if (layout.talkIndex[0] < layout.talks.player.count) {
                    self.layout.profile_player.image = UIImage(named: layout.profileOrder.player[layout.talkIndex[0]])
                    self.layout.text.setText(layout.talks.player[layout.talkIndex[0]])
                    layout.talkIndex[0] += 1
                    layout.backView.isUserInteractionEnabled = true
                }
                else if (layout.talkIndex[1] < (layout.talks as! TalkData_Ch2_part1).lion.count) {
                    
                    if (!minimi_lion) {
                        lionMinimiAnimation_IN()
                    }
                    else {
                        self.layout.revealAfterAnim()
                        self.layout.img_nametag.isHidden = false
                        self.layout.profile_player.image = UIImage(named: "suit_normal")
                        self.layout.text_nametag.text = "사자 부장"
                        self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch2_part1).lion[layout.talkIndex[1]])
                        self.layout.text.setText((layout.talks as! TalkData_Ch2_part1).lion[layout.talkIndex[1]])
                        layout.talkIndex[1] += 1
                        layout.backView.isUserInteractionEnabled = true
                    }

                }
                else if (layout.talkIndex[2] < (layout.talks as! TalkData_Ch2_part1).mouse.count) {
                    if (!minimi_mouse) {
                        mouseMinimiAnimation()
                    }
                    else {
                        self.layout.revealAfterAnim()
                        self.layout.text_nametag.text = "땃쥐 사원"
                        self.layout.profile_char.image = UIImage(named: (layout.profileOrder as! ImgOrderData_Ch2_part1).mouse[layout.talkIndex[2]])
                        self.layout.text.setText((layout.talks as! TalkData_Ch2_part1).mouse[layout.talkIndex[2]])
                        layout.talkIndex[2] += 1
                        layout.backView.isUserInteractionEnabled = true
                    }

                }
                // 선택지 등장
                else {
                    self.view.bringSubviewToFront(layout.layout_choice)
                    layout.layout_choice.isHidden = false
                    layout.layout_blackView.isHidden = false
                }
            }
        }
        
        // 선택지 후
        else {
            self.layout.img_nametag.isHidden = true
            self.layout.profile_player.image = UIImage(named: (layout.response as! Response_Ch2_part1).player_image[0][self.select_index])
            
            self.layout.text.setText((layout.response as! Response_Ch2_part1).player_response[0][self.select_index])
            
            //MARK: - fade in fade out
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.presentFull(Ch2Part2ViewController(), animated: false, completion: nil)
            }
        }
    }
    
    func lionMinimiAnimation_IN() {
        self.layout.backView.isUserInteractionEnabled = false
        self.layout.minimi_lion.isHidden = false
        self.layout.hideBeforeAnim()
        UIView.animate(withDuration: 1.3, delay: 0, options: .curveLinear  ,animations: {
            self.layout.minimi_lion.transform = CGAffineTransform(translationX: 0, y: 130)
        }, completion: { _ in
            self.layout.minimi_lion.image = UIImage(named: "minimi_lion_left")
            self.minimi_lion = true
            self.layout.backView.isUserInteractionEnabled = true
        })
    }
    
    func mouseMinimiAnimation() {
        self.layout.backView.isUserInteractionEnabled = false
        self.layout.minimi_mouse.isHidden = false
        self.layout.hideBeforeAnim()
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear  ,animations: {
            self.layout.minimi_mouse.transform = CGAffineTransform(translationX: 0, y: 60)
        }, completion: { _ in
            self.layout.minimi_mouse.image = UIImage(named: "minimi_mouse_left")
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: {
                self.layout.minimi_mouse.transform = CGAffineTransform(translationX: 55, y: 60)
            }, completion: { _ in
                self.layout.minimi_mouse.image = UIImage(named: "minimi_mouse_front")
                self.minimi_mouse = true
                self.layout.backView.isUserInteractionEnabled = true
            })
        })
    }
    
}
