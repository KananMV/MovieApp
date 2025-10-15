//
//  TopImageHeaderViewCell.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 14.10.25.
//

import UIKit
import SnapKit

protocol MovieDetailsCellProtocol {
    var imageUrl: String { get }
    var nameText: String { get }
    var languageText: String { get }
    var durationText: String { get }
    var ratingText: String { get }
}

class MovieDetailsCell: UICollectionViewCell {
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let movieLanguageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let movieDurationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let movieRatingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(movieLanguageLabel)
        view.addArrangedSubview(movieDurationLabel)
        view.addArrangedSubview(movieRatingLabel)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        let itemArr = [image, movieNameLabel, stackView]
        itemArr.forEach { contentView.addSubview($0) }
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(image.snp.width)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(data: MovieDetailsCellProtocol) {
        image.loadImage(path: data.imageUrl)
        movieNameLabel.text = data.nameText
        movieLanguageLabel.text = data.languageText
        movieDurationLabel.text = data.durationText
        movieRatingLabel.text = data.ratingText
    }
}

