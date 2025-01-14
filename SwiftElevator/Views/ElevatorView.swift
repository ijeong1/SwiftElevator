//
//  ElevatorView.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

import SwiftUI

struct ElevatorView: View {
    @StateObject private var viewModel: ElevatorViewModel
    
    init(service: ElevatorServiceProtocol) {
        _viewModel = StateObject(wrappedValue: ElevatorViewModel(service: service))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Elevator System")
                    .font(.title)
                    .padding()
                
                ForEach((1...20).reversed(), id: \.self) { floor in
                    FloorView(
                        floor: floor,
                        elevators: viewModel.elevators,
                        onCallPressed: { viewModel.requestElevator(floor: $0) }
                    )
                }
            }
            .padding(.vertical)
        }
    }
}
