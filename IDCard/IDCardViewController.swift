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
    var departmentData: DepartmentData?
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
        
        layout.label_txt.setTextAttribute("이름: \(( departmentData?.animalType.userName)!)\n부서: \(( departmentData?.animalType.myDept.dept)!)\n종족: \(( departmentData?.animalType.myDept.name)!)\n발급일자: \(( departmentData?.startDate)!)", 20, 15, .black)
        layout.layout_profile.image = departmentData?.animalType.myDept.profileImg
    }
    
    @objc func presentReference(_ btn: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
    @objc func shareTapGesture(_ home: UITapGestureRecognizer) {
        if let storyShareURL = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(storyShareURL) {
                let renderer = UIGraphicsImageRenderer(size: layout.layout_card.bounds.size)
                
                let renderImage = renderer.image { _ in
                    layout.layout_card.drawHierarchy(in: layout.layout_card.bounds, afterScreenUpdates: true)
                }
                guard let imageData = renderImage.pngData() else {return}
                
                let pasteboardItems : [String:Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor" : "#000046",
                    "com.instagram.sharedSticker.backgroundBottomColor" : "#1CB5E0",
                    
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate : Date().addingTimeInterval(300)
                ]
                
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                
                
                UIApplication.shared.open(storyShareURL, options: [:], completionHandler: nil)
            }
            else
            {
                let alert = UIAlertController(title: "공유가 어려워요", message: "인스타그램이 없어요!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func homeTapGesture(_ home: UITapGestureRecognizer) {
        self.dissmissAndPresent(StartViewController(), animated: false, completion: nil)
    }

}
