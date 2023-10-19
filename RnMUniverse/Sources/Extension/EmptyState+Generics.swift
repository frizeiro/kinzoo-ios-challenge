//
//  EmptyState+Generics.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 18/10/23.
//

import Foundation

extension EmptyState {
    
    // MARK: - Private Methods
    
    static func generic(
        _ actionHandler: @escaping () -> ()
    ) -> EmptyState {
        generic(
            text: .R.empty_state_message,
            actionHandler
        )
    }
    
    static func genericShort(
        _ actionHandler: @escaping () -> ()
    ) -> EmptyState {
        generic(
            text: .R.empty_state_message_short,
            actionHandler
        )
    }
    
    // MARK: - Private Methods
    
    private static func generic(
        text: String,
        _ actionHandler: @escaping () -> ()
    ) -> EmptyState {
        let action = EmptyStateAction(
            title: .R.try_again,
            handler: actionHandler
        )
        
        return EmptyState(
            image: .emptyState,
            title: .R.empty_state_title,
            text: text,
            action: action
        ) {
            return true
        }
    }
    
}
