//
//  ItemListTableViewCell.swift
//  LeeYunhak-practice-3
//
//  Created by 이윤학 on 10/28/23.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    
    static let identifier: String = "ItemListTableViewCell"
    
    private let stackView = UIStackView()
    private let productImageView = UIImageView()
    private let productNameLabel = UILabel()
    private let locationLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var likeButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setStyle() {
        self.backgroundColor = .init(red: 33.0 / 255.0, green: 33.0 / 255.0, blue: 33.0 / 255.0, alpha: 1.0)
        
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 8
        }
        
        productImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 5
            $0.clipsToBounds = true
        }
        
        productNameLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 2
            $0.textColor = .white
        }
        
        locationLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .systemGray
        }
        
        priceLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .black)
            $0.textColor = .white
        }
        
        likeButton.do {
            $0.addTarget(self,
                         action: #selector(likeButtonTapped),
                         for: .touchUpInside)
            $0.setImage(UIImage(systemName: "heart"), for: .normal)
            $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        }
    }
    
    private func setLayout() {
        [productImageView, stackView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(128)
        }
        
        [productNameLabel, locationLabel, priceLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.top.trailing.equalToSuperview().inset(16)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func bindData(data: ItemListData) {
        self.productImageView.image = UIImage(named: data.image)
        self.productNameLabel.text = data.item
        self.priceLabel.text = data.price
        self.locationLabel.text = data.location
        self.likeButton.isSelected = data.isLike
    }
    
    var likeTapCompletion: ((Bool) -> Void)?
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        guard let likeTapCompletion else {return}
        likeTapCompletion(likeButton.isSelected)
    }
    
}
