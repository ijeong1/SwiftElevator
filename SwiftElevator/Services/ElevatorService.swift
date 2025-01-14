//
//  ElevatorService.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

import Foundation

class ElevatorService: ElevatorServiceProtocol {
    @Published private(set) var elevators: [Elevator]
    private var timer: Timer?
    
    init() {
        self.elevators = [
            Elevator(id: 0),
            Elevator(id: 1)
        ]
        startSimulation()
    }
    
    private func startSimulation() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.moveElevators()
        }
    }
    
    func requestElevator(toFloor: Int) {
        guard toFloor >= 1 && toFloor <= 20 else { return }
        let nearestElevatorIndex = findNearestAvailableElevator(toFloor: toFloor)
        
        elevators[nearestElevatorIndex].destinationFloors.insert(toFloor)
        elevators[nearestElevatorIndex].direction = elevators[nearestElevatorIndex].currentFloor < toFloor ? .up : .down
        elevators[nearestElevatorIndex].isMoving = true
    }
    
    func moveElevators() {
        for index in elevators.indices {
            if !elevators[index].destinationFloors.isEmpty {
                let nextFloor = elevators[index].destinationFloors.min()!
                
                if elevators[index].currentFloor < nextFloor {
                    elevators[index].currentFloor += 1
                    elevators[index].direction = .up
                } else if elevators[index].currentFloor > nextFloor {
                    elevators[index].currentFloor -= 1
                    elevators[index].direction = .down
                } else {
                    elevators[index].destinationFloors.remove(nextFloor)
                    if elevators[index].destinationFloors.isEmpty {
                        elevators[index].isMoving = false
                        elevators[index].direction = .idle
                    }
                }
            }
        }
    }
    
    private func findNearestAvailableElevator(toFloor: Int) -> Int {
        var shortestDistance = Int.max
        var selectedElevator = 0
        
        for (index, elevator) in elevators.enumerated() {
            let distance = abs(elevator.currentFloor - toFloor)
            if distance < shortestDistance && !elevator.isMoving {
                shortestDistance = distance
                selectedElevator = index
            }
        }
        
        return selectedElevator
    }
}
