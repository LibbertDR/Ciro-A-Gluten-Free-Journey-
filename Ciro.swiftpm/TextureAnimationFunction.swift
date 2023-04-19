//
//  TextureAnimationFunction.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 18/04/23.
// The game has to be tested in portrait orientation

import Foundation
import SpriteKit

// MARK: -SpriteKit extensions
public extension SKSpriteNode {
    //function used to load texture array to animations, the for condition load the textures from startsAt to stopsAt they are added one by one in succession in textureArray used then to make the animation
    func loadTexture (atlas: String , prefix : String, startsAt : Int, stopsAt : Int) -> [SKTexture]
    {
        var textureArray = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: atlas)
        for i in startsAt...stopsAt
        {
            let textureName = "\(prefix)\(i)" //switching sprites one over another
            let temp = textureAtlas.textureNamed(textureName)
            textureArray.append(temp)
        }
        return textureArray
    }

//how many times the animation has to be repeated: count == animation will be forever
    func startAnimations(textures: [SKTexture], speed: Double, name: String, count: Int, resize: Bool, restore: Bool)
        {
            if(action(forKey: name) == nil)
            {
                let animation = SKAction.animate(with: textures, timePerFrame: speed, resize: resize, restore: restore) //set the animation frame-by-frame , timePerFrame duration of each texture
                if count == 0{
                    let repeatAction = SKAction.repeatForever(animation)
                    run(repeatAction, withKey: name) //execute action
                }else if count == 1 {
                    run(animation, withKey: name)
                }else {
                    let reapeatAction = SKAction.repeat(animation, count: count)
                    run(reapeatAction, withKey: name)
                }
            }
        }
}

