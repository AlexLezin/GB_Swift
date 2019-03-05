//
//  SnakeBodyPart.swift
//  ZmeikaMobile
//
//  Created by Alexander Lezin on 31/01/2019.
//  Copyright © 2019 Alexander Lezin. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    var diameter: CGFloat {
        return 10.0
    }
    
    init(atPoint point: CGPoint) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)).cgPath
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        position = point
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("initcoder...")
    }
}
