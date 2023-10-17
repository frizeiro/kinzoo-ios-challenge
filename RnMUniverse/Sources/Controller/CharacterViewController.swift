//
//  CharacterViewController.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit
import NiceTable

class CharacterViewController: NiceTableViewController {
    
    // MARK: - Private Variables
    
    private let viewModel: CharacterViewModel
    
    // MARK: - Life Cycle
    
    init(viewModel: CharacterViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = viewModel.character.name
    }
    
    private func setupViewModel() {
        // TODO: network caching
        
        viewModel.bind { [weak self] sections in
            // TODO: empty state
            self?.tableView?.sections = sections
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
        
        viewModel.fetch()
    }
    
}
