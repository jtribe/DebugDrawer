
/*
Copyright <YEAR> <COPYRIGHT HOLDER>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
*/

//
// IMPORTANT
//
// Setup:
// 1. Drag the group of files "Reusable Debug Draw" into your project
// 2. Setup the gesture listener by adding "DebugDrawPresenter.sharedInstance.listenForGestureOn(view: window)" to AppDelegate
// 3. You can now tap 5 times anywhere to present the DebugDraw
//
// Notes
// - To change how the app decides weather to show the debug screen, or just a popover message, overide "typeEvaluation" with your own condition checking
// - To add things to the debug draw, simply edit the "DD_DrawViewController.swift" and the "DebugDraw.storyboard"
//

import UIKit

class DebugDrawPresenter {
	
	static let sharedInstance = DebugDrawPresenter()
	
	var typeEvaluation: (Void) -> (DebugDrawType) = {
		#if DEBUG
			return .debugDraw
		#else
			return .debugMessage
		#endif
	}
	
	func listenForGestureOn(view: UIView?){
		let tap = UITapGestureRecognizer(target: self, action: #selector(present))
		tap.numberOfTapsRequired = 5
		view?.addGestureRecognizer(tap)
	}
	
	// MARK: Presentation Methods
	
	@objc func present(){
		let type = typeEvaluation()
		if type == .debugDraw {
			presentDebugDraw()
		} else if type == .debugMessage {
			presentDebugMessage()
		}
	}
	
	// used in debug
	fileprivate func presentDebugDraw() {
		if let currentViewController = UIApplication.topViewController(),
			let debugViewController = UIStoryboard(name: "DebugDraw", bundle: nil).instantiateInitialViewController() {
			currentViewController.present(debugViewController, animated: true, completion: nil)
		}
	}
	
	// used in producation
	fileprivate func presentDebugMessage() {
		
		guard let window = UIApplication.shared.keyWindow,
			let messageView = UINib(nibName: "DD_MessageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? DD_MessageView else {
			return
		}

		messageView.frame = CGRect(x: (window.frame.size.width - 180)/2, y: (window.frame.size.height - 100)/2, width: 180, height: 100)
		messageView.hide()
		window.addSubview(messageView)
		
		// animate in and out again
		UIView.animate(withDuration: 0.25, animations: {
			messageView.show()
		}, completion: { _ in
			UIView.animate(withDuration: 0.25, delay: 5	, options: .curveEaseInOut, animations: {
				messageView.hide()
			}, completion: { (finished) in
				messageView.removeFromSuperview()
			})
		})
		
	}
	
}
