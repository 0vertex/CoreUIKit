//
//  Anchorable.swift
//  CoreUIKit
//
//  Created by Manish on 17/10/21.
//

import UIKit

public protocol Anchorable {
    @discardableResult
    func add(to parentView: UIView) -> Self
    
    @discardableResult
    func set(identifier: String) -> Self
    
    @discardableResult
    func allAnchorsSame(on parentView: UIView, margin: UIEdgeInsets) -> Self
    
    @discardableResult
    func leading(with anchor: NSLayoutXAxisAnchor,
                 relation: ConstraintRelation,
                 margin: CGFloat) -> Self
    
    @discardableResult
    func trailing(with anchor: NSLayoutXAxisAnchor,
                  relation: ConstraintRelation,
                  margin: CGFloat) -> Self
    
    @discardableResult
    func top(with anchor: NSLayoutYAxisAnchor,
             relation: ConstraintRelation,
             margin: CGFloat) -> Self
    
    @discardableResult
    func bottom(with anchor: NSLayoutYAxisAnchor,
                relation: ConstraintRelation,
                margin: CGFloat) -> Self
    
    @discardableResult
    func with(width: CGFloat?, height: CGFloat?) -> Self
    
    @discardableResult
    func centerX(with anchor: NSLayoutXAxisAnchor, margin: CGFloat) -> Self
    
    @discardableResult
    func centerY(with anchor: NSLayoutYAxisAnchor, margin: CGFloat) -> Self
    
    @discardableResult
    func center(on parentView: UIView, with size: CGSize) -> Self
    
    func setConstraintIdentifier(for anchorType: AnchorType, for constraint: NSLayoutConstraint)
}
