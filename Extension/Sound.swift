//
//  Sound.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/20.
//

import Foundation
import AVKit

class Sound {
    var button_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "button_clicked", withExtension: "wav")!)
    func playSelectSound() {
        button_bgm.play()
    }
}
