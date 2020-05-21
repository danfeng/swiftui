//
//  KeyboardResponder.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    var keyboardShow: Bool { keyboardHeight > 0 }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(kyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kyboardWillHide(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func kyboardWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        keyboardHeight = frame.height
    }
    
    @objc private func kyboardWillHide(_ notification: Notification) {
        keyboardHeight = 0
    }
}
