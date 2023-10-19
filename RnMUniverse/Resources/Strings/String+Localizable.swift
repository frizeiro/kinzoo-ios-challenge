//
//  String+Localizable.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

extension String {
    
    struct R {
        
        // MARK: - Public Variables
        
        static let empty_state_message = l("empty_state_message")
        static let empty_state_message_short = l("empty_state_message_short")
        static let empty_state_title = l("empty_state_title")
        static let episodes = l("episodes")
        static let episodes_message = l("episodes_message")
        static let gender = l("gender")
        static let location = l("location")
        static let name = l("name")
        static let origin = l("origin")
        static let species = l("species")
        static let status = l("status")
        static let title = l("title")
        static let try_again = l("try_again")
        static let type = l("type")
        
    }
    
    // MARK: - Public Methods
    
    static func localized(_ key: String) -> String {
        return .l(key)
    }
    
    // MARK: - Private Methods
    
    private static func l(_ key: String) -> String {
        return NSLocalizedString(key, bundle: .main, comment: "")
    }
    
}
