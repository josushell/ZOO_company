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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
    }
}
