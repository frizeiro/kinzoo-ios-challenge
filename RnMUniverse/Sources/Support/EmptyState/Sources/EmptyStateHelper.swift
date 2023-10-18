//
//  EmptyStateHelper.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class EmptyStateHelper {
    
    // MARK: - Public Variables
    
    public var states: [EmptyStateRepresentable] = [] {
        didSet {
            reload()
        }
    }
    
    // MARK: - Private Variables
    
    private weak var view: UIView?
    
    private var currentEmptyState: EmptyStateRepresentable?
    private var emptyStateView: UIView?
    
    private var containerView: UIView? {
        if let backgroundView = view as? EmptyStateBackgroundView {
            return backgroundView.safeBackgroundView
        } else {
            return view
        }
    }
    
    // MARK: - Life Cycle
    
    public init(in view: UIView) {
        self.view = view
    }
    
    // MARK: - Public Methods
    
    public func reload() {
        guard let emptyState = states.first(where: { $0.shouldDisplayHandler() }) else { return removeEmptyView() }
        
        if emptyState.identifier != currentEmptyState?.identifier {
            currentEmptyState = emptyState
        }
        
        showEmptyStateView()
        
        updateUserInteractions()
    }
    
    // MARK: - Private Methods
    
    private func createEmptyView() {
        guard let currentEmptyState else { return }
        
        removeEmptyView()
        emptyStateView = EmptyStateView(currentEmptyState)
    }
    
    private func showEmptyStateView() {
        createEmptyView()
        
        guard let emptyStateView, let containerView else { return }
        
        containerView.addSubview(emptyStateView)
        containerView.bringSubviewToFront(emptyStateView)
        
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyStateView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            emptyStateView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            emptyStateView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            emptyStateView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0)
        ])
    }
    
    private func removeEmptyView() {
        emptyStateView?.removeFromSuperview()
        emptyStateView = nil
        
        updateUserInteractions()
    }
    
    private func updateUserInteractions() {
        guard let scrollView = view as? UIScrollView else { return }
        
        let enabled = emptyStateView == nil
        scrollView.setContentOffset(scrollView.contentOffset, animated: false)
        scrollView.isScrollEnabled = enabled
        scrollView.delaysContentTouches = enabled
    }
    
}
