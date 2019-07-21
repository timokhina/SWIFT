//
//  snake.swift
//  game_snake
//
//  Created by Shakhvorostov on 15/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import Foundation
import SpriteKit

class Snake: SKShapeNode {
    
    var body = [snakeBodyPart]()
    let moveSpeed = 125.0
    var angle: CGFloat = 0.0
    
    convenience init(atPoint point: CGPoint){
        self.init()
        
        let head = snakeHead(atPoint: point)
        
        body.append(head)
        addChild(head)
     
    }
    
    
    func addBodyPart() {
        
        let newBodyPart = snakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y ))
        
        body.append(newBodyPart)
        
        addChild(newBodyPart)
        
    }
    
    func move(){
        
        guard !body.isEmpty else { return }
        
        let head = body[0]
        moveHead(head)
        
        for index in (0..<body.count) where index > 0 {
            
            let previousBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            
            moveBodyPart(previousBodyPart, c:currentBodyPart )

        }
        
        
    }
    
    func moveHead(_ head: snakeBodyPart) {
        
        let dx = CGFloat(moveSpeed) * sin(angle)
        let dy = CGFloat(moveSpeed) * cos(angle)
        
        let nextPostion = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        
        
        let moveAction = SKAction.move(to: nextPostion, duration: 1.0)
        
        head.run(moveAction)
        
    }
    
    func moveBodyPart(_ p: snakeBodyPart, c: snakeBodyPart){
        
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        
        c.run(moveAction)
        
    }
    
    func moveClockwise(){

        angle += CGFloat(Double.pi/2)
    }
   
    func movecounterClockwise(){
        angle -= CGFloat(Double.pi/2)
    }
    
}
