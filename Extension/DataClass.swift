//
//  DataClass.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

// MARK: - dialog 데이터
class TalkData: Name {
    var player: [String] = []
}

// MARK: - profile 순서
class ImgOrderData {
    var player: [String] = []
}

// MARK: - 선택지 데이터
class ChoiceData {
    var title: [String] = []
    var choice1: [String] = []
    var choice2: [String] = []
    var choice3: [String] = []
    
}

// MARK: - 선택지 반응
class Response: Name {
    var player_response: [[String]] = [[]]
    var player_image: [[String]] = [[]]
}

// MARK: - 유저 이름 클래스
class Name {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }
}

// MARK: - 유저 능력치 결과 클래스
enum GameStats: Int {
    case Mental = 0         // 멘탈
    case Relationship = 1   // 인간관계
    case Diligent = 2       // 성실성
    case Efficiency = 3     // 효율성
    case Passion = 4        // 열정
}

// MARK: - 부서 분류 결과 클래스
class Department {
    func getDeptStr( _ param: Int) -> String {
        switch param {
        case 1:
            return "인사팀"
        case 2:
            return "디자인팀"
        case 3:
            return "개발팀"
        case 4:
            return "영업팀"
        case 5:
            return "회계팀"
        case 6:
            return "마케팅팀"
        default:
            return "인사팀"
        }
    }
    
    func getAnimalType(_ param: Int) -> String {
        switch param {
        case 1:
            return "독수리"
        case 2:
            return "코알라"
        case 3:
            return "거북이"
        case 4:
            return "래서판다"
        case 5:
            return "고슴도치"
        case 6:
            return "가젤"
        default:
            return "독수리"
        }
    }
}
