//
//  GameOverScene.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 17/04/23.
// The game has to be tested in portrait orientation

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    let background = SKSpriteNode(texture: SKTexture(imageNamed: "background1"))
    let hScore = UserDefaults.standard.integer(forKey: "highScore")
    let score = UserDefaults.standard.integer(forKey: "score")
    
 //MARK: -Init
  init(size: CGSize, won:Bool) {
    super.init(size: size)
      
      addChild(background)
      
      //PLAYER CUTE ANIMATION
      let player = PlayerAnimationClass()
      player.position = CGPoint(x: frame.midX, y: 0.8*(size.height))
      player.size.width  = player.size.width/2
      player.size.height = player.size.height/2
      player.idle()
      addChild(player)
      
      //GAME OVER LABEL
      let gameOverText = SKLabelNode(text: "GAME OVER")
      gameOverText.fontName = "AmericanTypewriter-Bold"
      gameOverText.fontSize = 32
      gameOverText.fontColor = SKColor.white
      gameOverText.position = CGPoint(x: size.width/2, y:  0.65*(size.height))
      addChild(gameOverText)
      
      //SCORE LABEL
      let scoreText = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
      scoreText.text = "SCORE: \(score)"
      scoreText.fontSize = 16
      scoreText.fontColor = SKColor.white
      scoreText.position = CGPoint(x: size.width/2, y:  0.50*(size.height))
      addChild(scoreText)
      
      //HIGHSCORE LABEL
      let highScoreText = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
      highScoreText.text = "HIGHSCORE: \(hScore)"
      highScoreText.fontSize = 14
      highScoreText.fontColor = SKColor.white
      highScoreText.position = CGPoint(x: size.width/2, y:  0.45*(size.height))
      addChild(highScoreText)
      
      //RETRY BUTTON
      let retryButton = SKSpriteNode(imageNamed: "Retry")
      retryButton.name = "retrybtn"
      retryButton.position = CGPoint(x: size.width/2, y:  0.35*(size.height))
      addChild(retryButton)
      
      //INFO LABEL
      let infoText = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
      infoText.text = "Rember what crops Ciro can eat: corn, rice and quinoa are gluten free crops."
      infoText.fontSize = 6
      infoText.fontColor = SKColor.white
      infoText.position = CGPoint(x: size.width/2, y:  0.25*(size.height))
      addChild(infoText)
      
      
   }
  // override an initializer:
  required init(coder aDecoder: NSCoder) {
    fatalError("error")
  }
    
 //MARK: -Touch handling on retry button
    //relauches the game scene to restart the game
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)

        guard let touch = touches.first
        else { return }
        let nodeClicked = atPoint(touch.location(in: self))
        // if the user taps on retry button:
        if nodeClicked.name == "retrybtn" {
            
            run(SKAction.run() { [weak self] in
                // transition to a new scene in SpriteKit
                guard let `self` = self
                else { return }
                // add transition:
                let reveal = SKTransition.push(with: .up, duration: 0.25)
                let scene = GameScene(size: self.size)
                self.view?.presentScene(scene, transition:reveal)
              }
              )
          }
      }
}
