//
//  PlayerAnimationClass.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 18/04/23.
// The game has to be tested in portrait orientation

import Foundation
import SpriteKit

//useful to switch between animations
enum PlayerAnimationType: String {
    case idle
    case moves
}

class PlayerAnimationClass : SKSpriteNode {
    // MARK: -Properties
    //Texture (Animation)
    private var idleTextures: [SKTexture]? //holds the texture
    private var movesTextures: [SKTexture]? //holds the texture
    // MARK: -Init
    //texture initialization
    init(){
        //set a default texture
        let texture = SKTexture(imageNamed: "Ciro")
        //define the atlas where texture are found and tells which ones are to take
        super.init(texture: texture, color: .clear, size: texture.size())
            self.idleTextures = loadTexture(atlas: "idleTextures", prefix: "Ciro", startsAt: 1, stopsAt: 4)
            self.movesTextures = loadTexture(atlas: "movesTextures", prefix: "Ciromoves", startsAt: 1, stopsAt: 9)
        }
    
        required init?(coder aDecoder: NSCoder)
        {
            fatalError("init(coder:) has not been implemented")
        }

//two functions to differentiate animations
    func idle()
            {
            //check for textures
            guard let idleTextures = idleTextures else{
                preconditionFailure("Could not find Texture!")
            }
            startAnimations(textures: idleTextures, speed: 0.25, name: PlayerAnimationType.idle.rawValue, count: 0, resize: false, restore: false)
            //the higher speed the longer the frame displayed
        }
    func moves()
            {
            guard let movesTextures = movesTextures else{
                preconditionFailure("Could not find Texture!")
            }
            startAnimations(textures: movesTextures, speed: 0.25, name: PlayerAnimationType.moves.rawValue, count: 0, resize: false, restore: false)
    }
}

