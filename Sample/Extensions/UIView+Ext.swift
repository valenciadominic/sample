//
//  RoundedView.swift
//  Sample
//
//  Created by Dominic Valencia on 7/26/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addLayerChanges(cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .white) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        if cornerRadius > 0 {
            clipsToBounds = true
        }
    }
}
