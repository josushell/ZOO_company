//
//  AnimalClass.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/18.
//

import Foundation
import UIKit

// 부서, UIimage(프로필), 설명, 잘맞는 부서, 안맞는 부서, 종족
struct Animal {
    var dept: String = ""
    var name: String = ""
    var profileImg: UIImage?
}

class AnimalType {
    var userName: String = Name().name
    var myDept: Animal = Animal()
    var explain: String = ""
    var goodDept: Animal = Animal()
    var badDept: Animal = Animal()
}

// 인사팀 독수리
class EagleType: AnimalType {
    override init() {
        super.init()
        
        myDept.dept = "인사팀"
        myDept.name = "독수리"
        myDept.profileImg = UIImage(named: "team_hr")
        explain = ""
            
        goodDept
    }
}


