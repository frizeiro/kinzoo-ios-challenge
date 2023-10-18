//
//  BaseViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation

open class BaseViewModel<T, B> {
    
    // MARK: - Public Variables
    
    var tappedHandler: ((T) -> Void)? = nil
    var bindHandler: (([B]) -> Void)? = nil
    var paginationHandler: (([B], Bool) -> Void)? = nil
    var errorHandler: ((EmptyState?) -> Void)? = nil
    var loaderHandler: ((Bool) -> Void)? = nil
    
    // MARK: - Public Methods
    
    open func fetch() {}
    
    func handle(_ error: Error) {
        let emptyState = error.toEmptyState { [weak self] in
            self?.fetch()
        }
        errorHandler?(emptyState)
    }
    
}
