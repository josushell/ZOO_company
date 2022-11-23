//
//  DataClass.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/18.
//

import Foundation
import UIKit

class TalkData: Name {
    var player: [String] = []
}

class ImgOrderData {
    var player: [String] = []
}

class ChoiceData {
    var title: [String] = []
    var choice1: [String] = []
    var choice2: [String] = []
    var choice3: [String] = []
    
}

class Response: Name {
    var player_response: [[String]] = [[]]
    var player_image: [[String]] = [[]]
}

class Name {
    var name: String {
        if let appdel = UIApplication.shared.delegate as? AppDelegate {
            return appdel.name
        }
        return "anonymous"
    }
}

enum GameStats: Int {
    case Mental = 0
    case Relationship = 1
    case Diligent = 2
    case Efficiency = 3
    case Passion = 4
}

class Department {
    func getAnimalType( _ param: Int) -> AnimalType {
        switch param {
        case 1:
            return EagleType()
        case 2:
            return KoalaType()
        case 3:
            return TurtleType()
        case 4:
            return RedPandaType()
        case 5:
            return HedgehogType()
        case 6:
            return GazelleType()
        default:
            return EagleType()
        }
    }
    
    func getAnimal(_ param: Int) -> Animal {
        switch param {
        case 1:
            return Eagle()
        case 2:
            return Koala()
        case 3:
            return Turtle()
        case 4:
            return RedPanda()
        case 5:
            return Hedgehog()
        case 6:
            return Gazelle()
        default:
            return Eagle()
        }
    }
}
