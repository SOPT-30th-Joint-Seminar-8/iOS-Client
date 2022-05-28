//
//  PopularProfileTVC.swift
//  Careerly
//
//  Created by User on 2022/05/19.
//

import UIKit

class PopularProfileTVC: UITableViewCell {
    // MARK: - Vars & Lets Part
    static let identifier = "PopularProfileTVC"
    var indexPath: Int?
    var profiles: [HotProfile]?
    
    // MARK: - @IBOutlet Part
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        configureCollectionView()
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Custom Method Part
    func configureCollectionView() {
        let nib = UINib(nibName: PopularProfileCVC.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PopularProfileCVC.identifier)
    }
}

// MARK: - Extension Part
extension PopularProfileTVC: UICollectionViewDelegate {
}

extension PopularProfileTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PopularProfileCVC.identifier,
            for: indexPath) as? PopularProfileCVC,
              let profiles = profiles
        else { return UICollectionViewCell() }
        cell.setData(profiles[indexPath.row])
        return cell
    }
}

extension PopularProfileTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 152
        let height = 270
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
    }
    // Cell간의 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
