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
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        // TODO: Add to localizeble
        title = "RNM Universe"
        
        collectionView?.itemsSize = .estimatedProportional(width: 170, proportionalHeight: 1)
    }
    
    private func setup() {
        // TODO: network caching
        
        viewModel.bind { [weak self] sections in
            // TODO: empty state
            self?.collectionView?.sections = sections
        }
        
        viewModel.pagination { [weak self] page, item in
            // TODO: pagination
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
