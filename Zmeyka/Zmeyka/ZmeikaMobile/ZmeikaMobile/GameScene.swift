//
//  GameScene.swift
//  ZmeikaMobile
//
//  Created by Alexander Lezin on 31/01/2019.
//  Copyright © 2019 Alexander Lezin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.allowsRotation = false
        view.showsPhysics = true
        
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockwiseButton.fillColor = .lightGray
        counterClockwiseButton.strokeColor = UIColor.gray.withAlphaComponent(0.5)
        counterClockwiseButton.lineWidth = 5
        counterClockwiseButton.name = "counterClockwiseButton"
        addChild(counterClockwiseButton)
        
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        clockwiseButton.fillColor = .lightGray
        clockwiseButton.strokeColor = UIColor.gray.withAlphaComponent(0.5)
        clockwiseButton.lineWidth = 5
        clockwiseButton.name = "clockwiseButton"
        addChild(clockwiseButton)
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        addChild(snake!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake?.move()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchlocation = touch.location(in: self)
            guard let touchedNode = atPoint(touchlocation) as? SKShapeNode, touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                return
            }
            touchedNode.fillColor = .gray
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchlocation = touch.location(in: self)
            guard let touchedNode = atPoint(touchlocation) as? SKShapeNode, touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                return
            }
            touchedNode.fillColor = .lightGray
        }
    }
    
    private func createApple() {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX)) + 1)
        let margin: CGFloat = 30 + 45 + 5
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - margin)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        addChild(apple)
    }
}
