//
//  EdgeBody.swift
//  game_snake
//
//  Created by Anna Timokhina on 21/07/2019.
//  Copyright © 2019 Shakhvorostov. All rights reserved.
//

import Foundation
import SpriteKit

class EdgeBody: SKShapeNode {
   convenience init(position: CGPoint){
    self.init()
    self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    self.physicsBody!.categoryBitMask = collisionCategories.EdgeBody

    }
}
