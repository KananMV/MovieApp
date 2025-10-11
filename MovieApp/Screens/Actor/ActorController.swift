//
//  ActorController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 10.10.25.
//

import UIKit

class ActorController: UIViewController {
    
    let vm = ActorViewModel()
    
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
        title = "Actors"
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViewModel() {
        vm.getPopularActors()
        
        vm.error = { errorMessage in
            print(errorMessage)
        }
        
        vm.success = {
            self.collectionView.reloadData()
        }
    }
}
extension ActorController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        cell.configure(data: vm.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedActorID = vm.items[indexPath.item].id ?? 0
        print(selectedActorID)
        
        let vc = ActorMovieListController(vm: ActorMovieListViewModel(id: selectedActorID))
        
        navigationController?.show(vc, sender: nil)
    }
    
    
}
