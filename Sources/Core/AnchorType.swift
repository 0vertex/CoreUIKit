//
//  AnchorType.swift
//  CoreUIKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

public enum AnchorType: String {
    case leading
    case trailing
    case top
    case bottom
    case centerX
    case centerY
    case width
    case height
}

public extension AnchorType {
    
    func generateIdentifier(with viewIdentifier: String) -> String {
        return "\(viewIdentifier)_\(self.rawValue)Anchor"
    }
    
}
