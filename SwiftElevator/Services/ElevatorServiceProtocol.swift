//
//  ElevatorServiceProtocol.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

// ElevatorService Protocol
protocol ElevatorServiceProtocol {
    var elevators: [Elevator] { get }
    func requestElevator(toFloor: Int)
    func moveElevators()
}
