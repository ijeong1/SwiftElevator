//
//  SwiftElevatorApp.swift
//  SwiftElevator
//
//  Created by Ilnam Jeong on 1/14/25.
//

import SwiftUI

// App Entry
@main
struct SwiftElevatorApp: App {
    // ElevatorService
    let service = ElevatorService()
    
    var body: some Scene {
        WindowGroup {
            ElevatorView(service: service)
        }
    }
}
