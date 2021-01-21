//
//  Apple.swift
//  ZmeikaMobile
//
//  Created by Alexander Lezin on 31/01/2019.
//  Copyright © 2019 Alexander Lezin. All rights reserved.
//

import UIKit
import SpriteKit


class Apple: SKShapeNode {
    convenience init(position: CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = .red
        strokeColor = .red
        lineWidth = 5
        self.position = position
    }
}
