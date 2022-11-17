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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
        layout.btn_back.addTarget(self, action: #selector(presentReference), for: .touchUpInside)
        layout.layout_main.isUserInteractionEnabled = true
        layout.btn_back.isUserInteractionEnabled = true
    }
    
    @objc func presentReference(_ btn: UIButton) {
        self.dismiss(animated: true)
    }

}
