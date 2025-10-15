//
//  CategoryController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 11.10.25.
//

import UIKit

class CategoryController: UIViewController {
    
    private let viewModel = CategoryViewModel()
    
    private let category: CategoryType
    
    init(category: CategoryType) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        title = category.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        view.dataSource = self
        view.delegate = self
        view.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        return view
    }()
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureViewModel()
    }
    
    func setupView() {
        view.backgroundColor = .red
        view.addSubview(collectionView)
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pulledRefres), for: .valueChanged)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureViewModel() {
        viewModel.fetchCategory(type: category)
        
        viewModel.success = {
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
            
        }
        
        viewModel.error = { message in
            print("Error:", message)
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc private func pulledRefres() {
        viewModel.reset()
        collectionView.reloadData()
        viewModel.fetchCategory(type: category)
    }
    
    
}

extension CategoryController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(data: viewModel.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemId = viewModel.movies[indexPath.item].id ?? 0
        
        let vc = MovieDetailsController(viewModel: .init(id: itemId))
        navigationController?.show(vc, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item, category: category)
    }
    
    
}
