//
//  ElevatorViewModel.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

import Foundation
// Library to use AnyCancellable
import Combine

class ElevatorViewModel: ObservableObject {
    @Published private(set) var elevators: [Elevator] = []
    private let service: ElevatorServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: ElevatorServiceProtocol) {
        self.service = service
        
        // Observe elevator updates if service is ElevatorService
        if let elevatorService = service as? ElevatorService {
            elevatorService.$elevators
                .receive(on: DispatchQueue.main)
                .assign(to: \.elevators, on: self)
                .store(in: &cancellables)
        }
    }
    
    func requestElevator(floor: Int) {
        service.requestElevator(toFloor: floor)
    }
}
