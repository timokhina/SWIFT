//
//  snakeHead.swift
//  game_snake
//
//  Created by Shakhvorostov on 15/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import Foundation
import SpriteKit

class snakeHead: snakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = collisionCategories.snakeHead
        self.physicsBody?.contactTestBitMask = collisionCategories.EdgeBody | collisionCategories.Apple | collisionCategories.Snake
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
