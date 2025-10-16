//
//  SimilarsCollerctionViewCell.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 15.10.25.
//

import UIKit

protocol SimilarsCollectionViewCellProtocol {
    var movieArr: Movie { get }
}


class SimilarsCollectionViewCell: UICollectionViewCell {
    
    var completion: ((Int) -> Void)?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var items = [MovieResult]()
    
    private func setupView() {
        contentView.backgroundColor = .clear
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
    
    func configure(data: SimilarsCollectionViewCellProtocol) {
        items = data.movieArr.results ?? []
        collectionView.reloadData()
    }
    
    
}

extension SimilarsCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemId = items[indexPath.item].id ?? 0
        completion?(itemId)
    }
    
    
}
