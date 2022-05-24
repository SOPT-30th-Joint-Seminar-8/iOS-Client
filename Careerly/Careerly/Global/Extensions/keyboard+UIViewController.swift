//
//  keyboard+UIViewController.swift
//  Careerly
//
//  Created by 안현주 on 2022/05/21.
//

import UIKit

extension UIViewController {
  func hideKeyboard() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer (target: self,
                                                              action: #selector(UIViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
