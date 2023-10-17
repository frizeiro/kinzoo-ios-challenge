//
//  BaseViewModel.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation

open class BaseViewModel<T, B> {
    
    // MARK: - Private Variables
    
    private(set) var tappedHandler: ((T) -> Void)? = nil
    private(set) var bindHandler: (([B]) -> Void)? = nil
    private(set) var paginationHandler: (([B], Bool) -> Void)? = nil
    private(set) var errorHandler: ((Int, Error) -> Void)? = nil
    private(set) var loaderHandler: ((Bool) -> Void)? = nil
    
    // MARK: - Public Methods
    
    func tap(_ handler: ((T) -> Void)?) {
        tappedHandler = handler
    }
    
    func bind(_ handler: (([B]) -> Void)?) {
        bindHandler = handler
    }
    
    func pagination(_ handler: (([B], Bool) -> Void)?) {
        paginationHandler = handler
    }
    
    func error(_ handler: ((Int, Error) -> Void)?) {
        errorHandler = handler
    }
    
    func loader(_ handler: ((Bool) -> Void)?) {
        loaderHandler = handler
    }
    
}
