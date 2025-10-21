//
//  MovieDetailsController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 11.10.25.

import UIKit

class MovieDetailsController: UIViewController {
    
    let viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        layout.minimumLineSpacing = 50
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(MovieDetailsCell.self, forCellWithReuseIdentifier: "MovieDetailsCell")
        view.register(SimilarsCollectionViewCell.self, forCellWithReuseIdentifier: "SimilarsCollectionViewCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViewModel() {
        viewModel.getMovieData()
        viewModel.getSimilarMovies()
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        
        viewModel.success = {
            self.collectionView.reloadData()
        }
    }
    
    
}

extension MovieDetailsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as? MovieDetailsCell else { return UICollectionViewCell() }
            if let itemArr = viewModel.items {
                cell.configure(data: itemArr)
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarsCollectionViewCell", for: indexPath) as? SimilarsCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure(data: viewModel.similarItems)
            
            cell.completion = { id in
                let cordinator = MovieDetailsCordinator(navigation: self.navigationController ?? UINavigationController(), movieId: id)
                cordinator.start()
                
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width - 32, height: collectionView.frame.height/2)
        } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 4)
        }
        
    }
    
    
}
