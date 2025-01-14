//
//  Elevator.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

struct Elevator: Identifiable {
    let id: Int
    var currentFloor: Int
    var isMoving: Bool
    var direction: Direction
    var destinationFloors: Set<Int>
    
    enum Direction: String {
        case up, down, idle
    }
    
    init(id: Int) {
        self.id = id
        self.currentFloor = 1
        self.isMoving = false
        self.direction = .idle
        self.destinationFloors = []
    }
}
