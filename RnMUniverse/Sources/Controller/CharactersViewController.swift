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
    
    private lazy var emptyStateHelper: EmptyStateHelper = {
        EmptyStateHelper(in: view)
    }()
    
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
        viewModel.bindHandler = { [weak self] sections in
            self?.collectionView?.sections = sections
        }
        
        viewModel.paginationHandler = { [weak self] sections, hasMore in
            self?.collectionView?.sections = sections
            self?.collectionView?.loadMoreEnabled = hasMore
        }
        
        viewModel.errorHandler = { [weak self] error in
            if let error {
                self?.emptyStateHelper.states = [error]
            } else {
                self?.emptyStateHelper.states = []
            }
        }
        
        viewModel.loaderHandler = { [weak self] loading in
            if loading {
                self?.showLoader()
            } else {
                self?.hideLoader()
            }
        }
        
        viewModel.tappedHandler = { [weak self] character in
            self?.navigationHelper.characters.detail(character)
        }
        
        viewModel.fetch()
    }
    
}
