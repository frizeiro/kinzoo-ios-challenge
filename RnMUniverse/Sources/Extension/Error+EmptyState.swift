//
//  Error+EmptyState.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

extension Error {
    
    func toEmptyState(
        _ actionHandler: @escaping () -> ()
    ) -> EmptyState {
        // TODO: The main idea was to handle each error. Or at least, the main known errors.
        let action = EmptyStateAction(
            title: .R.try_again,
            handler: actionHandler
        )
        
        return EmptyState(
            image: .emptyState,
            title: .R.empty_state_title,
            text: .R.empty_state_message,
            action: action
        ) {
            return true
        }
    }
    
}
