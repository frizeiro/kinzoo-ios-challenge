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
    
    private lazy var emptyStateHelper: EmptyStateHelper = {
        EmptyStateHelper(in: view)
    }()
    
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
        viewModel.bindHandler = { [weak self] sections in
            self?.tableView?.sections = sections
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
        
        viewModel.fetch()
    }
    
}
