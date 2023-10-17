//
//  UIView+Loader.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 16/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - Public Variables
    
    public var hasLoader: Bool {
        return loaderView != nil
    }
    
    // MARK: - Private Variables
    
    private var loaderView: LoaderView? {
        return subviews.first(where: { $0.isLoaderView }) as? LoaderView
    }
    
    // MARK: - Public Methods
    
    public func showLoader() {
        if let loaderView {
            loaderView.count += 1
        } else {
            let loaderView = LoaderView(frame: bounds)
            
            addSubview(loaderView)
            
            NSLayoutConstraint.activate([
                loaderView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                loaderView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
                loaderView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                loaderView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
            ])
            
            loaderView.oldUserInteraction = isUserInteractionEnabled
            isUserInteractionEnabled = false
        }
    }
    
    public func hideLoader(forcing: Bool = false) {
        guard let loaderView = loaderView else { return }
        
        loaderView.count -= 1
        
        if loaderView.count == 0 || forcing {
            isUserInteractionEnabled = loaderView.oldUserInteraction
            loaderView.removeFromSuperview()
        }
    }
    
}

private extension UIView {
    
    var isLoaderView: Bool {
        return tag == LoaderView.loaderTag && self is LoaderView
    }
    
}

private class LoaderView: UIView {
    
    // MARK: - Public Variables
    
    static var loaderTag: Int {
        return 860828200418
    }
    
    var count: Int = 1
    var oldUserInteraction: Bool = true
    
    // MARK: - Private Variables
    
    private lazy var blurStyle: UIBlurEffect.Style = {
        if #available(iOS 13.0, *) {
            return .systemMaterial
        } else {
            return .extraLight
        }
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: .large)
        } else {
            indicator = UIActivityIndicatorView(style: .whiteLarge)
            indicator.color = .gray
        }
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        
        return indicator
    }()
    
    private lazy var container: UIView = {
        let container = UIView(frame: .zero)
        container.layer.cornerRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        container.isAccessibilityElement = true
        container.accessibilityLabel = indicator.accessibilityLabel
        
        let reducedTransparencyColor = UIColor(white: 0.937, alpha: 0.8)
        container.applyBlur(blurStyle, alpha: 0.9, reducedTransparencyColor: reducedTransparencyColor)
        
        return container
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        newSuperview?.hideLoader(forcing: true)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        container.alpha = 0
        container.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        
        UIView.animate(withDuration: 0.26) {
            self.container.alpha = 1
            self.container.transform = .identity
        }
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        tag = Self.loaderTag
        translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalToConstant: 100),
            container.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
}
