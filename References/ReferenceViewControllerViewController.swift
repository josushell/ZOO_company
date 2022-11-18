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
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
        layout.btn_next.isUserInteractionEnabled = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentIDCard))
        layout.btn_next.addGestureRecognizer(tapGesture!)
    }
    
    @objc func presentIDCard(_ gesture: UITapGestureRecognizer) {
        let IDCard = IDCardViewController()
        //IDCard.modalTransitionStyle = .partialCurl
        IDCard.modalTransitionStyle = .flipHorizontal
        IDCard.modalPresentationStyle = .fullScreen
        self.present(IDCard, animated: true, completion: nil)
        
        //self.presentPartialCurl(IDCardViewController(), animated: true, completion: nil)
    }
}
