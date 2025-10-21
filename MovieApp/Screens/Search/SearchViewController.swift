//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Kenan Memmedov on 19.10.25.
//

import UIKit

class SearchViewController: UIViewController {
    
    let vm = SearchViewModel()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        view.showsVerticalScrollIndicator = false
        view.isHidden = true
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 50
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(TopImageBottomLabelCell.self, forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        return view
    }()
    
    
    
    private let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func configureViewModel() {
        vm.getMovieData()
        
        vm.error = { errorMessage in
            print(errorMessage)
        }
        
        vm.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as? SearchTableViewCell else { return UITableViewCell() }
        cell.configure(data: vm.items[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItemID = vm.items[indexPath.row].id
        let cordinator = MovieDetailsCordinator(navigation: self.navigationController ?? UINavigationController(), movieId: selectedItemID ?? 0)
        cordinator.start()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        vm.tablePagination(index: indexPath.row)
    }
    
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.defaultItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as? TopImageBottomLabelCell else { return UICollectionViewCell() }
        
        cell.configure(data: vm.defaultItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        vm.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItemID = vm.defaultItems[indexPath.row].id
        let cordinator = MovieDetailsCordinator(navigation: self.navigationController ?? UINavigationController(), movieId: selectedItemID ?? 0)
        cordinator.start()
    }
    
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            vm.items.removeAll()
            tableView.reloadData()
            return
        }
        
        vm.getSearchedMovieData(query: text)
        
        vm.error = { error in
            print(error)
        }
        
        vm.success = { [weak self] in
            self?.tableView.isHidden = false
            self?.collectionView.isHidden = true
            self?.tableView.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.tableView.isHidden = false
        self.collectionView.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.tableView.isHidden = true
        self.collectionView.isHidden = false
        self.configureViewModel()
    }
}


