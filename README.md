# DebugDraw

## Setup
1. Drag the group of files "Reusable Debug Draw" into your project.  
2. Setup the gesture listener by adding the following to `AppDelegate`.  
`DebugDrawPresenter.sharedInstance.listenForGestureOn(view: window)`
3. You can now tap 5 times anywhere to present the DebugDraw.  

## Notes
- To change how the app decides weather to show the debug screen, or just a popover message, overide the `typeEvaluation` message in the `DebugDrawPresenter` singleton, with your own condition checking.  
- To add things to the debug draw, simply edit the `DD_DrawViewController.swift` and the `DebugDraw.storyboard`.  
