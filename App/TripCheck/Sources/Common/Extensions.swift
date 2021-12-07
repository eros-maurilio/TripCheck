//
//  Extensions.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import Foundation
import SwiftUI

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
