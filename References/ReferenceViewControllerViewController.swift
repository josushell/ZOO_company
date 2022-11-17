//
//  ResultViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/09.
//

import Foundation
import UIKit

// MARK: - 추천서 페이지 & 사원증
class ReferenceViewController: UIViewController {
    let layout = layout_reference()
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
        
        self.view.isUserInteractionEnabled = true
        layout.layout_scroll.isUserInteractionEnabled = true
        layout.layout_main.isUserInteractionEnabled = true
        layout.btn_next.isUserInteractionEnabled = true
        
        layout.btn_next.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(presentIDCard(_:)))
    }
    
    @objc func presentIDCard(_ gesture: UITapGestureRecognizer) {
        //print("yes")
        let IDCard = IDCardViewController()
        IDCard.modalTransitionStyle = .partialCurl
        IDCard.modalPresentationStyle = .fullScreen
        self.present(IDCard, animated: true, completion: nil)
    }
}
