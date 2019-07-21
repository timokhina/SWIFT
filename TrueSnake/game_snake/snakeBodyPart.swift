//
//  snakeBodyPart.swift
//  game_snake
//
//  Created by Shakhvorostov on 15/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import Foundation
import SpriteKit

class snakeBodyPart: SKShapeNode {
    let diametr = 10
    
    init(atPoint point: CGPoint){
        
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diametr), height: CGFloat(diametr))).cgPath
        
        fillColor = UIColor.green
        
        strokeColor = UIColor.green
        
        lineWidth = 5
        
        self.position = point
        
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr - 4), center: CGPoint(x: 5, y: 5))
        
        self.physicsBody?.isDynamic = true
        
        self.physicsBody?.categoryBitMask = collisionCategories.Snake
        
        self.physicsBody?.contactTestBitMask = collisionCategories.EdgeBody | collisionCategories.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
