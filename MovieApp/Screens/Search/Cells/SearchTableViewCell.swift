//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 20.10.25.
//

import UIKit

protocol SearchTableViewCellProtocol {
    var imageURL: String { get }
    var titleText: String { get }
}

class SearchTableViewCell: UITableViewCell {
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        image.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(image.snp.height)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(image.snp.trailing).offset(12)
        }
    }
    
    
    func configure(data: SearchTableViewCellProtocol) {
        image.loadImage(path: data.imageURL, fileSize: .w300)
        label.text = data.titleText
    }
    
}
