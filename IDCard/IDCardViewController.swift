//
//  IDCardViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/17.
//

import UIKit

//MARK: - 사원증 view controller
class IDCardViewController: UIViewController {
    let layout = layout_IDCard()
    var shareTap: UITapGestureRecognizer?
    var homeTap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
        layout.btn_back.addTarget(self, action: #selector(presentReference), for: .touchUpInside)
        layout.layout_main.isUserInteractionEnabled = true
        layout.btn_back.isUserInteractionEnabled = true
        
        layout.btn_share.isUserInteractionEnabled = true
        layout.btn_home.isUserInteractionEnabled = true
        
        shareTap = UITapGestureRecognizer(target: self, action: #selector(shareTapGesture))
        homeTap = UITapGestureRecognizer(target: self, action: #selector(homeTapGesture))
        
        layout.btn_share.addGestureRecognizer(shareTap!)
        layout.btn_home.addGestureRecognizer(homeTap!)
    }
    
    @objc func presentReference(_ btn: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
    @objc func shareTapGesture(_ home: UITapGestureRecognizer) {
        print("share")
        
    }
    
    @objc func homeTapGesture(_ home: UITapGestureRecognizer) {
        print("home")
    }

}
