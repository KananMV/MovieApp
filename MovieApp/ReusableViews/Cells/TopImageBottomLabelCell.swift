//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import UIKit

protocol TopImageBottomLabelCellProtocol {
    var titleText: String { get }
    var imageURL: String { get }
}

class TopImageBottomLabelCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(8)
        }
        
    }
    
    func configure(data: TopImageBottomLabelCellProtocol) {
        image.loadImage(path: data.imageURL)
        label.text = data.titleText
    }
    
}
