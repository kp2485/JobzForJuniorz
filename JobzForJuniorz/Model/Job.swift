//
//  Job.swift
//  JobzForJuniorz
//
//  Created by Kyle Peterson on 2/12/23.
//

import Foundation

struct Job {
    let jobGoal: JobGoal
    let targetPosition: Vector
    var buildTime: Int
    let requirements: [Requirement]
    
    init(jobGoal: JobGoal, targetPosition: Vector, buildTime: Int = 1, requirements: [Requirement] = []) {
        self.jobGoal = jobGoal
        self.targetPosition = targetPosition
        self.buildTime = buildTime
        self.requirements = requirements
    }
    
    enum JobGoal {
        case changeTile(Tile)
        case moveToLocation
        case fetchItems(ItemStack)
    }
}

extension Job: CustomStringConvertible {
    var description: String {
        "\(jobGoal) at: \(targetPosition)"
    }
    
    var debugDescription: String {
        "\(jobGoal) at: \(targetPosition) - buildTime remaining: \(buildTime)"
    }
}

// MARK: Convenience builder functions
extension Job {
    static func createMoveToLocationJob(targetLocation: Vector) -> Job {
        Job(jobGoal: .moveToLocation, targetPosition: targetLocation, buildTime: 1)
    }
    
    static func createFetchItemsJob(itemsToFetch: ItemStack, targetLocation: Vector) -> Job {
        Job(jobGoal: .fetchItems(itemsToFetch), targetPosition: targetLocation, buildTime: 1, requirements: [.position])
    }
}
