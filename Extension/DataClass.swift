//
//  DataClass.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

// MARK: - dialog 데이터
class TalkData {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }

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
class Response {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }
    
    var player_response: [[String]] = [[]]
    var player_image: [[String]] = [[]]
}
