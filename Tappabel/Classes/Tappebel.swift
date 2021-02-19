/// Copyright (c) 2017-present Ahmed Mohamed <dev@ahmd.pro>
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

/// A subclass of UILabel that adds tap functionality.
open class Tappebel: UILabel {
    /// The action to be performed when the label is tapped.
    public var tapAction: ((_ label: Tappebel) -> Void)?
    /// Indicates whether the tap action should be enabled.
    public var actionEnabled: Bool = true
    /// The tap gesture recognizer.
    private var tapGesture = UITapGestureRecognizer()
    /// The number of taps required to perform the tap action.
    /// Default is one tap.
    public var numberOfTaps: Int = 1 {
        didSet {
            self.tapGesture.numberOfTapsRequired = numberOfTaps
        }
    }
    /// The number of fingers required to perform the tap action.
    /// Default is one finger.
    public var numberOfTouches: Int = 1 {
        didSet {
            self.tapGesture.numberOfTouchesRequired = numberOfTouches
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        self.isUserInteractionEnabled = true
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.tapGesture.numberOfTapsRequired = self.numberOfTaps
        self.tapGesture.numberOfTouchesRequired = self.numberOfTouches
        self.addGestureRecognizer(tapGesture)
    }
    
    /// Performs an action when the label is tapped.
    @objc open func tap() {
        guard let tapAction = self.tapAction, self.actionEnabled == true else {
            return
        }
        
        tapAction(self)
    }
    
    
    /// Disables the tap action of the label for a certain
    /// amount of time.
    ///
    /// - Parameter seconds: Amount of time to disable the tap action for.
    public func pauseAction(_ seconds: Double) {
        self.actionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
            self?.actionEnabled = true
        }
    }
    
}
