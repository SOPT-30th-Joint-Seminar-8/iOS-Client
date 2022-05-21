//
//  TableViewHeaderView.swift
//  Careerly
//
//  Created by User on 2022/05/18.
//

import UIKit

final class TableViewHeaderView: UIView {
    
    // MARK: - Vars & Lets Part
    static let identifier: String = String(describing: TableViewHeaderView.self)
    
    // MARK: - @IBAction Part
    @IBAction func postFeedBtnDidTap(_ sender: UIButton) {
        // feed 작성 화면으로 이동
        print("Debug: Tapped")
    }
}
