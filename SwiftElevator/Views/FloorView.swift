//
//  FloorView.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//
import SwiftUI

struct FloorView: View {
    let floor: Int
    let elevators: [Elevator]
    let onCallPressed: (Int) -> Void
    
    var body: some View {
        HStack {
            Text("Floor \(floor)")
                .frame(width: 80, alignment: .leading)
            
            ForEach(elevators) { elevator in
                Image(systemName: elevator.currentFloor == floor ? "square.fill" : "square")
                    .foregroundColor(elevator.currentFloor == floor
                                     ? (elevator.isMoving ? .red : .blue)
                                     : .gray)
                    .overlay(
                        Text(elevator.direction.rawValue)
                            .font(.system(size: 8))
                            .opacity(elevator.currentFloor == floor ? 1 : 0)
                    )
            }
            
            Spacer()
            
            Button("Call") {
                onCallPressed(floor)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal)
    }
}
