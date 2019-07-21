//
//  GameScene.swift
//  game_snake
//
//  Created by Shakhvorostov on 15/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import SpriteKit
import GameplayKit


struct collisionCategories {
    
    static let Snake:UInt32 = 0x1 << 0
    static let snakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
    let SCENE_EDGE_CATEGORY: UInt32 = 0x1
    
}

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black

        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        let counterClockwiseButton = SKShapeNode()
        
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        counterClockwiseButton.fillColor = UIColor.gray
        
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY + 30)
        
        counterClockwiseButton.strokeColor = UIColor.gray
        
        counterClockwiseButton.lineWidth = 10
        
        counterClockwiseButton.name = "counterClockwiseButton"
        
        self.addChild(counterClockwiseButton)
        
        let clockwiseButton = SKShapeNode()
        
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        clockwiseButton.fillColor = UIColor.gray
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY + 30)
        
        clockwiseButton.strokeColor = UIColor.gray
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
        
        
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        
        self.addChild(snake!)
      
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = collisionCategories.EdgeBody
        
        self.physicsBody?.collisionBitMask = collisionCategories.Snake | collisionCategories.snakeHead
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockwiseButton" else {
                return
            }
            
            touchesNode.fillColor = .green
            
            if touchesNode.name == "counterClockwiseButton" {
                snake!.movecounterClockwise()
            } else if touchesNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
            
        }
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        for touch in touches {
            
        let touchLocation = touch.location(in: self)
        
        guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockwiseButton" else {
            return
        }
        
        touchesNode.fillColor = .gray
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        snake!.move()
    }
    
    
    func createApple() {
        
        
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-10))+1)
        
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-10))+1)

        let apple = Apple(position: CGPoint(x: randX, y: randY))
        
        self.addChild(apple)
    }
    
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        print("Apple: \(collisionCategories.Apple)")
        print("Body: \(collisionCategories.EdgeBody)")
        print("Snake: \(collisionCategories.Snake)")
        print("Head: \(collisionCategories.snakeHead)")
        print("bodyes: \(bodyes)")
        
        
        let collisionObject = bodyes - collisionCategories.snakeHead
        print("collisionObject: \(collisionObject)")
        
        
        switch collisionObject {
        case collisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
    
        case collisionCategories.EdgeBody:
            let border = contact.bodyA.node is EdgeBody ? contact.bodyA.node : contact.bodyB.node
            
            self.snake?.removeFromParent()
            self.snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
            addChild(self.snake!)
        
        default:
            break
            
        }
        
    }
    
}
