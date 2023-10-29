//
//  CollectionViewController.swift
//  LeeYunhak-practice-3
//
//  Created by 이윤학 on 10/28/23.
//

import UIKit
import SnapKit
import Then

import UIKit

class ImageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionViewConfig()
        setStyle()
        setLayout()
        
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setStyle() {
        collectionView.do {
            $0.backgroundColor = .black
        }
        setCollectionViewLayout()
        
    }
    
    // 레이아웃 세팅
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    private func setCollectionViewConfig() {
        self.collectionView.register(ImageCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
}

// MARK: - Extensions


extension ImageViewController: UICollectionViewDelegate {}

extension ImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}

extension ImageViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}
