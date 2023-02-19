//
//  Vector.swift
//  JobzForJuniorz
//
//  Created by Kyle Peterson on 2/12/23.
//

import Foundation

struct Vector {
    var x: Int
    var y: Int
    
    static var zero: Vector {
        Vector(x: 0, y: 0)
    }
    
    static var up: Vector {
        Vector(x: 0, y: 1)
    }
    
    static var down: Vector {
        Vector(x: 0, y: -1)
    }
    
    static var left: Vector {
        Vector(x: -1, y: 0)
    }
    
    static var right: Vector {
        Vector(x: 1, y: 0)
    }
    
    static func +(lhs: Vector, rhs: Vector) -> Vector {
        Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(lhs: Vector, rhs: Vector) -> Vector {
        Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

extension Vector: Hashable { }
