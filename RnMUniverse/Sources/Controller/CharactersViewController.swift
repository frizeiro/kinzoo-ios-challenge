//
//  CharactersViewController.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 14/10/23.
//

import Foundation
import UIKit
import NiceTable

class CharactersViewController: NiceCollectionViewController {

    // MARK: - Private Variables
    
    private let viewModel = CharactersViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLoadMore()
        setupViewModel()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = .R.title
        
        var width: CGFloat = 170
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            width = 300
        }
        collectionView?.itemsSize = .estimatedProportional(width: width, proportionalHeight: 1)
    }
    
    private func setupLoadMore() {
        collectionView?.loadMoreEnabled = true
        
        collectionView?.loadMoreHandler = { [weak self] in
            self?.viewModel.fetchNextPage()
        }
    }
    
    private func setupViewModel() {
        // TODO: network caching
        
        viewModel.bind { [weak self] sections in
            // TODO: empty state
            self?.collectionView?.sections = sections
        }
        
        viewModel.pagination { [weak self] sections, hasMore in
            self?.collectionView?.sections = sections
            self?.collectionView?.loadMoreEnabled = hasMore
        }
        
        viewModel.error { [weak self] page, error in
            // TODO: handle errors
        }
        
        viewModel.loader { [weak self] loading in
            if loading {
                self?.showLoader()
            } else {
                self?.hideLoader()
            }
        }
        
        viewModel.tap { [weak self] character in
            self?.navigationHelper.characters.detail(character)
        }
        
        viewModel.fetch()
    }
    
}
