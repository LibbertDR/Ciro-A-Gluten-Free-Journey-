
//
//  GameScene.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 15/04/23.
// The game has to be tested in portrait orientation

import SpriteKit
import GameplayKit
import CoreMotion

public class GameScene: SKScene, SKPhysicsContactDelegate {
    //-MARK: VAR & LET
    //main node of the game and some of its attributes, also displyed on screen
    let player = PlayerAnimationClass()
    
    let heart = SKSpriteNode(texture: SKTexture(imageNamed: "Heart"))
    var livesLabel: SKLabelNode!
    var lives: Int = 0 {
        didSet {
            livesLabel.text = "x\(lives)"
        }
    }
   //variables useful for the scoring system
    var highScore : Int = 0
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    //this timer tells when the crops are going to be generated
    var cropsTimer: Timer!
    
    //IDENTIFIERS FOR BITMASKS
    let nGfCategory: UInt32 = 0x1 << 2
    let gfCategory: UInt32 = 0x1 << 1
    let ciroCategory: UInt32 = 0x1 << 0
    
    let bg = SKSpriteNode(texture: SKTexture(imageNamed: "BackGround"))
    
    public override func didMove (to view: SKView) {
            
        //-MARK: MAIN CHARACTER
        player.position = CGPoint(x: frame.midX, y: frame.midY/2)
        player.size.width  = player.size.width/2
        player.size.height = player.size.height/2
        player.moves()
        addChild(player)
        
        //Physics for contact detection
        physicsWorld.gravity = CGVector(dx: 0 , dy: 0)
        physicsWorld.contactDelegate = self
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0.1*(self.size.width), height: 0.1*(self.size.height)),
                                           center: CGPoint(x: 0.5 , y: 0.5)
        )
        player.physicsBody?.isDynamic = true
        
        player.physicsBody?.categoryBitMask = ciroCategory
        player.physicsBody?.contactTestBitMask = gfCategory
        player.physicsBody?.contactTestBitMask = nGfCategory

        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.usesPreciseCollisionDetection = true
        
        //-MARK: LIVES
        heart.position = CGPoint (x: frame.midX * 1.6, y: frame.midY * 0.15)
        heart.size.width  = heart.size.width/2
        heart.size.height = heart.size.height/2
        heart.zPosition = 10
        addChild(heart)
        
        livesLabel = SKLabelNode (text: "x3")
        livesLabel.position = CGPoint (x: frame.midX * 1.75, y: frame.midY * 0.1)
        livesLabel.fontName =
            "AmericanTypewriter-Bold"
        livesLabel.fontSize = 14
        livesLabel.fontColor = UIColor.white
        lives = 3
        livesLabel.zPosition = 10
        self.addChild(livesLabel)
        
        //-MARK: SCORE
        scoreLabel = SKLabelNode (text: "Score: 0")
        scoreLabel.position = CGPoint (x: frame.midX, y: frame.midY * 1.8)
        scoreLabel.fontName =
            "AmericanTypewriter-Bold"
        scoreLabel.fontSize = 16
        scoreLabel.fontColor = UIColor.white
        score = 0
        scoreLabel.zPosition = 10
        self.addChild(scoreLabel)
            
        //-MARK: CROPS
        cropsTimer = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(addNgfCrops), userInfo: nil, repeats: true)
        cropsTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(addGfCrops), userInfo: nil, repeats: true)
        
        //-MARK: BACKGROUND
        bg.zPosition = -10
        bg.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(bg)
        
    }
    
    //-MARK: CROPS MANAGEMENT
//randomly shuffle, using GameKit functions, the first position of the vector and randomly define the position of the new generated crop and its movement
    @objc func addNgfCrops(){
        possibleNgfCrops = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleNgfCrops) as! [Crops]
        let crop = SKSpriteNode (imageNamed: possibleNgfCrops[0].cropType)
        let randomCropPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(frame.size.width))
        let position = CGFloat(randomCropPosition.nextInt())
        
        crop.position = CGPoint(x: position , y: self.frame.size.height + crop.size.height)
        
        //ADDING PHYSICS CHARACTERISTICS TO CROPS
        crop.physicsBody = SKPhysicsBody(rectangleOf: crop.size)
        crop.physicsBody?.isDynamic = true
        
        crop.physicsBody?.categoryBitMask = nGfCategory
        crop.physicsBody?.contactTestBitMask = ciroCategory
        
        crop.physicsBody?.collisionBitMask = 0
        self.addChild (crop)
        
        //CROPS MOVEMENT
        let animationDuration: TimeInterval = 6
        var actionArray = [SKAction]()
        actionArray.append (SKAction.move(to: CGPoint(x: position, y: -crop.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        crop.run (SKAction.sequence(actionArray))
    }
    
    @objc func addGfCrops(){
        
        possibleGfCrops = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleGfCrops) as! [Crops]
        let crop = SKSpriteNode (imageNamed: possibleGfCrops[0].cropType)
        let randomCropPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(frame.size.width))
        let position = CGFloat(randomCropPosition.nextInt())
        
        crop.position = CGPoint(x: position , y: self.frame.size.height + crop.size.height)
        
        //ADDING PHYSICS CHARACTERISTICS TO CROPS
        crop.physicsBody = SKPhysicsBody(rectangleOf: crop.size)
        crop.physicsBody?.isDynamic = true
        
        crop.physicsBody?.categoryBitMask = gfCategory
        crop.physicsBody?.contactTestBitMask = ciroCategory

        crop.physicsBody?.collisionBitMask = 0
        self.addChild (crop)
        
        //CROPS MOVEMENT
        let animationDuration: TimeInterval = 6
        var actionArray = [SKAction]()
        actionArray.append (SKAction.move(to: CGPoint(x: position, y: -crop.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        crop.run (SKAction.sequence (actionArray))
    }
    
    //-MARK: BIRD MOVEMENT
    public override func touchesMoved (_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.position.x = location.x
        }
    }
    
    //-MARK: CONTACT MANAGING
    public func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (firstBody.categoryBitMask & ciroCategory) != 0 && (secondBody.categoryBitMask & nGfCategory) != 0 {
            birdDidCollideWithNgfCrop(birdNode: firstBody.node as! SKSpriteNode, cropNode: secondBody.node as! SKSpriteNode)
        }else if (firstBody.categoryBitMask & ciroCategory) != 0 && (secondBody.categoryBitMask & gfCategory) != 0 {
            birdDidCollideWithGfCrop(birdNode: firstBody.node as! SKSpriteNode, cropNode: secondBody.node as! SKSpriteNode)
        }
//two functions to define if the define what appens when the bird collides with dofferent crops
        func birdDidCollideWithNgfCrop(birdNode : SKSpriteNode , cropNode : SKSpriteNode ) {
            lives -= 1
            let oldHighScore = UserDefaults.standard.integer(forKey: "highScore")
            cropNode.removeFromParent()
            //Call for game over screen
            if(lives == 0)
            {
                //saving the last highscore and comparing it to the new one
                if(score>oldHighScore){
                    highScore = score
                    UserDefaults.standard.set(highScore, forKey: "highScore")
                    UserDefaults.standard.set(score, forKey: "score")
                } else {
                    UserDefaults.standard.set(score, forKey: "score")
                }
                let reveal = SKTransition.flipHorizontal(withDuration: 0.25)
                let scene = GameOverScene(size: self.size, won: false)
                self.view?.presentScene(scene, transition:reveal)
            }
        }
        func birdDidCollideWithGfCrop(birdNode : SKSpriteNode , cropNode : SKSpriteNode ) {
            score += 100
            cropNode.removeFromParent()
        }
    }
}
