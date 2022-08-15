//
//  Ch2Part2ViewController.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/14.
//

import UIKit

class Ch2Part2ViewController: UIViewController {

    let layout = layout_Office()
    var selected: Bool = false
    var select_index: Int = 0
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initView(self.view)
        layout.backView

    }

}
