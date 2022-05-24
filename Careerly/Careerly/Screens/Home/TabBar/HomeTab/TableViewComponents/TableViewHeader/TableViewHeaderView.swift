//
//  TableViewHeaderView.swift
//  Careerly
//
//  Created by User on 2022/05/18.
//

import UIKit

protocol TableViewHeaderViewDelegate: AnyObject {
    func presentPostView()
}

final class TableViewHeaderView: UIView {
    
    // MARK: - Vars & Lets Part
    static let identifier: String = String(describing: TableViewHeaderView.self)
    weak var delegate: TableViewHeaderViewDelegate?
    
    // MARK: - @IBAction Part
    @IBAction func postFeedBtnDidTap(_ sender: UIButton) {
        // feed 작성 화면으로 이동
        delegate?.presentPostView()
    }
}
