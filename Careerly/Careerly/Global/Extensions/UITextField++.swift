//
//  UITextField++.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/17.
//

import Foundation
import UIKit

extension UITextField{
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder()
    }
}
