//
//  UIImageView+LoadUrl.swift
//  RnMUniverse
//
//  Created by Felipe Frizeiro on 15/10/23.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    // MARK: - Piblic Methods
    
    func load(from urlSting: String, placeholder: UIImage = .placeholder) {
        sd_setImage(with: URL(string: urlSting), placeholderImage: placeholder)
    }
    
}
