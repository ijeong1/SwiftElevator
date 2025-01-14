Key Components for this project :
1. Models: Elevator with properties for state tracking
2. Service: Handles elevator logic and state management
3. ViewModel: Manages UI state and business logic
4. View: SwiftUI interface showing building floors and elevators
5. Dependency injection via protocols
6. Added proper state management using Combine framework

To run this version:

Create a new SwiftUI project in Xcode
Replace the default code with this implementation
Build and run

The app should now show:

20 floors with call buttons
Two elevators that move properly
Direction indicators when elevators are moving
Proper elevator selection based on proximity
Smooth animations and state updates

The elevators will show as
- Red when they're at a floor and moving
- Blue when they're at a floor and stopped
- Gray for all other floors they're not currently on

![demo](https://github.com/ijeong1/swiftelevator/blob/main/swiftelevator.gif)
