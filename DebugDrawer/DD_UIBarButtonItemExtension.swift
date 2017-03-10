
/*
Copyright 2017 jtribe

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
*/

import UIKit

extension UIBarButtonItem {
	
	static func squareItemWithImage(image: UIImage?, target: AnyObject?, action: Selector) -> UIBarButtonItem {
		let button = UIButton(type: .system)
		button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
		button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
		button.addTarget(target, action: action, for: .touchUpInside)
		button.tintColor = UIColor.black
		button.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
		return UIBarButtonItem(customView: button)
	}
	
}
