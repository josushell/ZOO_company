//
//  AnimalClass.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/11/18.
//

import Foundation
import UIKit

// MARK: - 동물 캐릭터 클래스: 부서, 종족, 프로필 이미지
class Animal {
    var dept: String = ""
    var name: String = ""
    var profileImg: UIImage?
}

class Eagle: Animal {
    override init() {
        super.init()
        
        dept = "인사팀"
        name = "독수리"
        profileImg = UIImage(named: "team_hr")
    }
}

class Turtle: Animal {
    override init() {
        super.init()
        
        dept = "개발팀"
        name = "거북이"
        profileImg = UIImage(named: "team_dev")
    }
}

class Koala: Animal {
    override init() {
        super.init()
        
        dept = "디자인팀"
        name = "코알라"
        profileImg = UIImage(named: "team_design")
    }
}

class RedPanda: Animal {
    override init() {
        super.init()
        
        dept = "영업팀"
        name = "래서판다"
        profileImg = UIImage(named: "team_sales")
    }
}

class Gazelle: Animal {
    override init() {
        super.init()
        
        dept = "마케팅팀"
        name = "가젤"
        profileImg = UIImage(named: "team_marketing")
    }
}

class Hedgehog: Animal {
    override init() {
        super.init()
        
        dept = "회계팀"
        name = "고슴도치"
        profileImg = UIImage(named: "team_accounting")
    }
}

// MARK: - 추천서 페이지에 필요한 데이터 클래스
class AnimalType {
    var userName: String = Name().name
    var myDept: Animal = Animal()
    var goodDept: Animal = Animal()
    var badDept: Animal = Animal()
    var explain: String = ""
}

class EagleType: AnimalType {
    override init() {
        super.init()
        
        myDept = Eagle()
        goodDept = Hedgehog()
        badDept = Koala()
        explain = "냉철하고 치밀한 성격을 가지고 있으며 모든 일에 열정을 가지고 임하는 자세를 가지고 있음. 주변 사람들을 잘 챙기고 눈치가 매우 빠르며 회사 내에서 매우 원만한 인간관계를 구축하고 있음. 동료들에게서 높은 신뢰와 인정을 받고 있으며, 사내 문화를 긍정적으로 조성하는 것에 큰 기여를 함. 따라서 \(userName)씨는 인사팀으로 배치 바람."
    }
}

class TurtleType: AnimalType {
    override init() {
        super.init()
        
        myDept = Turtle()
        goodDept = Hedgehog()
        badDept = RedPanda()
        explain = "극도의 효율을 추구하는 경향이 있으며 항상 도전적인 자세와 열정을 가지고 업무를 함. 전체적으로 본인 업무에 대한 이해도가 높고 충실하게 수행하여 타 사원들에게 모범이 됨. 또한 강인한 정신력을 보유하고 있어 어떤 일이 생겨도 자신의 길을 개척하는 도전적인 태도를 가지고 있음. 따라서 \(userName)씨는 개발팀으로 배치 바람."
    }
}
class KoalaType: AnimalType {
    override init() {
        super.init()
        
        myDept = Koala()
        goodDept = Gazelle()
        badDept = Turtle()
        explain = "예술감각이 뛰어나며 인내심과 창의력을 가지고 있음. 이를 바탕으로 업무 수행에서 긍정적인 결과를 보여줌. 또한 어떤 일에도 굴하지 않는 강한 정신력을 보유하고 있으며, 회사 내에서 매우 원만한 인간관계를 구축하고 있어 동료들에게 신뢰와 인정을 받음. 따라서 \(userName)씨는 디자인팀으로 배치 바람."
    }
}
class RedPandaType: AnimalType {
    override init() {
        super.init()
        
        myDept = RedPanda()
        goodDept = Koala()
        badDept = Turtle()
        explain = "타고난 말솜씨를 보유하고 있으며, 평소 동료들과 원만한 인간관계를 유지하여 평가가 좋음. 항상 열정적인 자세를 가지고 있으며 이를 바탕으로 주어진 일을 성공적으로 해냄. 또한 강인한 정신력을 보유하고 있어 어떤 일이 생겨도 자신의 길을 개척하는 도전적인 태도를 가지고 있음. 따라서 \(userName)씨는 영업팀으로 배치 바람."
    }
}
class GazelleType: AnimalType {
    override init() {
        super.init()
        
        myDept = Gazelle()
        goodDept = RedPanda()
        badDept = Eagle()
        explain = "타고난 말솜씨를 보유하고 있으며, 평소 동료들과 원만한 인간관계를 유지하여 평가가 좋음. 또한 밝은 성격으로 사내 문화를 긍정적으로 조성하는 것에 큰 기여를 함. 효율적인 성격으로 성실하게 업무를 잘 수행하며 이를 바탕으로 주어진 일을 성공적으로 해냄. 따라서 \(userName)씨는 마케팅팀으로 배치 바람."
    }
}
class HedgehogType: AnimalType {
    override init() {
        super.init()
        
        myDept = Hedgehog()
        goodDept = Eagle()
        badDept = Gazelle()
        explain = "체계적이고 효율적인 성격으로 성실하게 업무를 잘 수행함. 정리와 완벽한 설계가 있는 시스템을 추구하며 이를 바탕으로 주어진 일을 성공적으로 해냄. 동료들에게서 높은 신뢰와 인정을 받고 있으며, 사람들을 잘 챙기고 눈치가 매우 빠른 편임. 따라서 \(userName)씨는 회계팀으로 배치 바람."
    }
}
