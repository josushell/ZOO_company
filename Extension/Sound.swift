//
//  Sound.swift
//  Zoo Company
//
//  Created by JOSUEYEON on 2022/08/20.
//

import Foundation
import AVKit

class Sound {
    var button_bgm: AVAudioPlayer?
    
    init() {
        button_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "button_clicked", withExtension: "wav")!)
        button_bgm?.volume = 1
        button_bgm?.prepareToPlay()
    }
    
    func playSelectSound() {
        button_bgm?.play()
    }
    
    func setVolumeFadeOut(_ sender: AVAudioPlayer?, completion: (() -> Void)?) {
        sender?.setVolume(0, fadeDuration: 0.5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            sender?.stop()
            completion?()
        })
    }
    
}

class HomeSound: Sound {
    var home_bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        home_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "home_music", withExtension: "mp3")!)
        home_bgm?.volume = 0.7
        home_bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        home_bgm?.play()
    }
}

class ElevatorSound: Sound {
    var elevator_bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        elevator_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "elevator_sound", withExtension: "mp3")!)
        elevator_bgm?.volume = 1
        elevator_bgm?.prepareToPlay()
        
        button_bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "elevator_ding", withExtension: "mp3")!)
        button_bgm?.volume = 1
        button_bgm?.prepareToPlay()
    }
    
    func playElevatorMusic() {
        elevator_bgm?.play()
        button_bgm?.play(atTime: (button_bgm?.deviceCurrentTime ?? 0) + 2)
    }
}

class Ch1_part2: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch1_part2", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch1_part3: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch1_part3", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch2_part1: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch2_part1", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch2_part2: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch2_part2", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch3_part1: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch3_part1", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch3_part2: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch3_part2", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch4_part1: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch4_part1", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}


class Ch4_part2: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch4_part2", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch5_part1: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch5_part1", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ch5_part2: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ch5_part2", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}

class Ending: Sound {
    var bgm: AVAudioPlayer?
    
    override init() {
        super.init()
        
        bgm = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ending", withExtension: "mp3")!)
        bgm?.volume = 0.7
        bgm?.prepareToPlay()
    }
    func playHomeMusic() {
        bgm?.play()
    }
}
