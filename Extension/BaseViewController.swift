//
//  BaseViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/20.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    let layout = layout_base()
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    let sound = Sound()
    
    func registerGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(backTouched))
        layout.backView.addGestureRecognizer(tapGesture!)
        
        layout.btn_choice1.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice2.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        layout.btn_choice3.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
    }
    
    @objc func onBtnClicked(_ sender: UIButton) {
        sound.playSelectSound()
        if let label = sender.subviews.last as? UILabel {
            label.textColor = .black
        }
        
    }
    
    @objc func backTouched(_ sender: UITapGestureRecognizer) {
        
    }
}
