//
//  Snake.swift
//  ZmeikaMobile
//
//  Created by Alexander Lezin on 31/01/2019.
//  Copyright © 2019 Alexander Lezin. All rights reserved.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    let moveSpeed = 125.0
    var angle: CGFloat = 0.0
    var bodyParts = [SnakeBodyPart]()
    
    
    init(atPoint point: CGPoint) {
        super.init()
        let head = SnakeHead(atPoint: point)
        bodyParts.append(head)
        addChild(head)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBodyPart() {
        let bodyPart = SnakeBodyPart(atPoint: bodyParts[0].position)
        bodyParts.append(bodyPart)
        addChild(bodyPart)
    }
    
    func move() {
        guard bodyParts.isEmpty else { return }
        
        let head = bodyParts[0]
        moveHead(head)
    }
    
    private func moveHead(_ head: SnakeBodyPart) {
        let dx = CGFloat(moveSpeed) * sin(angle)
        let dy = CGFloat(moveSpeed) * cos(angle)
        let nextPosition = CGPoint(x: head.position.x + dx,
                                   y: head.position.x + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)
    }
}
