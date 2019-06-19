//
//  FavoritelListController.swift
//  Pokedex
//
//  Created by Luan Winck on 19/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class FavoriteListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let presenter: FavoriteListPresenterType = FavoriteListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self.presenter
        self.presenter.view = self
        self.presenter.fetchData()
    }
    
}

extension FavoriteListViewController: FavoriteListViewType {
    
    func reloadData() {
        self.collectionView.reloadData()
    }
    
}
