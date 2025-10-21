//
//  ViewController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 02.10.25.
//

import UIKit

import SnapKit

class HomeController: UIViewController {
    private let viewModel = HomeViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        view.dataSource = self
        view.delegate = self
        view.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViewModel() {
        viewModel.getMovieData()
        viewModel.success = {
            self.collectionView.reloadData()
        }
        viewModel.error = { message in
            print(message)
        }
    }


}
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        cell.configure(data: viewModel.items[indexPath.item])
        cell.callback = {
            let categoryType: CategoryType
            
            switch indexPath.item {
            case 0: categoryType = .popular
            case 1: categoryType = .upcoming
            case 2: categoryType = .topRated
            case 3: categoryType = .nowPlaying
            default: categoryType = .popular
            }
            
            let vc = CategoryController(category: categoryType)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.idCallback = { id in
            self.showMovieDetails(with: id)
        }
        
        return cell
    }
    
    func showMovieDetails(with id: Int) {
        let cordinator = MovieDetailsCordinator(navigation: self.navigationController ?? UINavigationController(), movieId: id)
        cordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 312)
    }
    
}


