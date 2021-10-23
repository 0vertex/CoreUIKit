//
//  Int+TypeConversion.swift
//  CoreUIKit
//
//  Created by Manish on 23/10/21.
//

import Foundation
import UIKit

public extension Int {
    
    var toCGSize: CGSize { CGSize(width: self, height: self) }
    
    var toUIEdgeInsets: UIEdgeInsets { UIEdgeInsets(topBottom: self.toCGFloat, leftRight: self.toCGFloat) }
    
    var toCGFloat: CGFloat { CGFloat(self) }
    
}
