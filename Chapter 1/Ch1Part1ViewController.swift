//
//  Ch1ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch1Part1ViewController: UIViewController {

    let layout = layout_home()
    var selected: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.talks = TalkData_Ch1_part1()
        layout.profileOrder = ImgOrderData_Ch1_part1()
        layout.choices = ChoiceData_Ch1_part1()
        layout.response = Response_Ch1_part1()
        layout.initView(self.view)
        
        // 3초 뒤 실행
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear ,animations: {
                self.layout.minimi_player.transform = CGAffineTransform(translationX: 0, y: 80)
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
        layout.backView.isUserInteractionEnabled = false
        select_index = sender.tag
        selected = true
        layout.layout_choice.isHidden = true
        layout.layout_blackView.isHidden = true
        
        self.layout.profile_player.image = UIImage(named: layout.response.player_image[0][self.select_index])
        self.layout.text.setText(layout.response.player_response[0][self.select_index])
        layout.backView.isUserInteractionEnabled = true
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
                }
                // 선택지 등장
                else {
                    self.view.bringSubviewToFront(layout.layout_choice)
                    layout.layout_blackView.isHidden = false
                    layout.layout_choice.isHidden = false
                }
            }
            layout.backView.isUserInteractionEnabled = true
        }
        
        // 선택지 후
        else {
            layout.backView.isUserInteractionEnabled = false
            //MARK: - fade in fade out
            //let vc = GameViewController()
            //self.presentFull(vc, animated: false, completion: nil)
            
            self.presentFull(Ch1Part2ViewController(), animated: true, completion: nil)
        }
    }
    
}
