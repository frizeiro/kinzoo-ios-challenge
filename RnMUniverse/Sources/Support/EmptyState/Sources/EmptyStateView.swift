//
//  EmptyStateView.swift
//  NiceEmptyState
//
//  Created by Felipe Frizeiro on 01/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    
    // MARK: - Public Variables
    
    var emptyState: EmptyStateRepresentable? {
        didSet {
            setupData()
        }
    }
    
    // MARK: - Private Variables
    
    // MARK: Outlets
    
    @IBOutlet private weak var contentView: UIView?
    @IBOutlet private weak var imageContainerView: UIStackView?
    @IBOutlet private weak var imageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var textLabel: UILabel?
    @IBOutlet private weak var actionButton: UIButton?
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    convenience init(_ emptyState: EmptyStateRepresentable) {
        self.init(frame: .zero)
        
        defer {
            self.emptyState = emptyState
        }
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        
        setupContentView()
    }
    
    private func setupContentView() {
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    private func setupData() {
        guard let emptyState else { return }
        
        imageView?.image = emptyState.image
        titleLabel?.text = emptyState.title
        textLabel?.text = emptyState.text
        actionButton?.setTitle(emptyState.action?.title, for: .normal)
        
        setupUI()
    }
    
    private func setupUI() {
        guard let emptyState else { return }
        
        imageContainerView?.isHidden = emptyState.image == nil
        actionButton?.isHidden = emptyState.action == nil
    }
    
    // MARK: Actions
    
    @IBAction private func actionButtonTouchUpInside() {
        emptyState?.action?.handler()
    }
    
}
