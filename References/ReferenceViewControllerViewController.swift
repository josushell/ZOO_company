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
    var dataAnimal: DepartmentData?
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.initViews(self.view)
        layout.btn_next.isUserInteractionEnabled = true
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentIDCard))
        layout.btn_next.addGestureRecognizer(tapGesture!)

        resultDataBinding()
    }

    @objc func presentIDCard(_ gesture: UITapGestureRecognizer) {
        let IDCard = IDCardViewController()
        IDCard.departmentData = self.dataAnimal
        //IDCard.modalTransitionStyle = .partialCurl
        IDCard.modalTransitionStyle = .flipHorizontal
        IDCard.modalPresentationStyle = .fullScreen
        self.present(IDCard, animated: true, completion: nil)
        
        //self.presentPartialCurl(IDCardViewController(), animated: true, completion: nil)
    }
    
    func resultDataBinding() {
        dataAnimal = DepartmentData()
        
        layout.layout_profile.image = dataAnimal?.animalType.myDept.profileImg
        layout.label_explain.setTextAttribute(dataAnimal?.animalType.explain ?? "", 13, 8, .black)
        layout.label_dept.text = (dataAnimal?.animalType.myDept.dept)! + " " +  (dataAnimal?.animalType.userName)!
        
        layout.label_goodDept.text = dataAnimal?.animalType.goodDept.dept
        layout.layout_goodDept.image = dataAnimal?.animalType.goodDept.profileImg
        
        layout.label_badDept.text = dataAnimal?.animalType.badDept.dept
        layout.layout_badDept.image = dataAnimal?.animalType.badDept.profileImg
        
        layout.barGraph.setBarAttribute(data: dataAnimal!.gameStat)
        layout.radarGraph.setRadarAttribute(data: dataAnimal!.gameStat)
    }
}
