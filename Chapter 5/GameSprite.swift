//
//  GameSprite.swift
//  prototype
//
//  Created by JOSUEYEON on 2022/05/16.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas: SKTextureAtlas {get set}
    var initialSize: CGSize {get set}
    func onTap()
}
