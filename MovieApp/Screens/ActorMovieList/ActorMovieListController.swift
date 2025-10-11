//
//  ActorMovieListController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import UIKit

class ActorMovieListController: UIViewController {
    
    let vm: ActorMovieListViewModel
    
    init(vm: ActorMovieListViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureViewModel()
        
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    func configureViewModel() {
        vm.getMovies()
        
        vm.error = { errorMessage in
            print(errorMessage)
        }
        
        vm.success = {
            self.collectionView.reloadData()
            
        }
    }

}

extension ActorMovieListController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.items.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(data: vm.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 240)
    }
    
    
    
    
}
