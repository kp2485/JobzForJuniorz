//
//  SpriteManager.swift
//  JobzForJuniorz
//
//  Created by Kyle Peterson on 2/19/23.
//

import Foundation
import SpriteKit

protocol SpriteManager {
    var cellSize: CGFloat { get }
    var zPosition: CGFloat { get }
    
    func redraw(world: World, in scene: SKScene)
    func cleanUp(world: World)
}
