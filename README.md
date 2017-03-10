# DebugDrawer

## Setup
1. Drag the group of files "Reusable Debug Drawer" into your project.  
2. Setup the gesture listener by adding the following to `AppDelegate`.  
`DebugDrawerPresenter.sharedInstance.listenForGestureOn(view: window)`
3. You can now tap 5 times anywhere to present the DebugDrawer.  

## Notes
- You can edit the values of `debugConfiguration` and `releaseConfiguration`, within the `DebugDrawerPresenter` singleton, to specify weather to display the full screen or popover message
- To add things to the debug drawer, simply edit the `DD_DebugScreenViewController.swift` and the `DebugDrawer.storyboard`.  
