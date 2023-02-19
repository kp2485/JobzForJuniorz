//
//  RequirementTests.swift
//  JobzForJuniorzTests
//
//  Created by Kyle Peterson on 2/12/23.
//

import XCTest
@testable import JobzForJuniorz

final class RequirementTests: XCTestCase {

    func testUnmetPositionRequirementSpawnMoveToLocationJob() {
        let world = World()
        let entity = Entity(name: "Example Entity", position: .zero)
        let job = Job(jobGoal: .changeTile(.Floor), targetPosition: .right, buildTime: 2, requirements: [.position])
        entity.jobs.push(job)
        
        XCTAssertEqual(entity.jobs.peek()?.buildTime ?? 0, 2)
        
        entity.update(in: world)
        
        XCTAssertGreaterThan(entity.jobs.count, 1, "There should be 2 jobs now.")
        
        guard let topJob = entity.jobs.peek() else {
            XCTFail("There should be at least one job.")
            return
        }
        
        switch topJob.jobGoal {
        case .moveToLocation:
            break
        default:
            XCTFail("The top job should be a move to location job.")
        }
    }

}