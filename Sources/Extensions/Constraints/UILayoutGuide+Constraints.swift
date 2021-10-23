//
//  UILayoutGuide+Constraints.swift
//  CoreUIKit
//
//  Created by Manish on 17/10/21.
//

import UIKit

// MARK: - Add
extension UILayoutGuide: Anchorable {
    
    /// Adds current view to provided parent view (if it's not already added)
    /// - Parameter parentView: a view on which current view (child view) needs to be added
    /// - Returns: current view
    @discardableResult
    public func add(to parentView: UIView) -> Self {
        // Add
        parentView.addLayoutGuide(self)
        
        return self
    }
    
    /// Sets `accessibilityIdentifier` on current view
    @discardableResult
    public func set(identifier: String) -> Self {
        self.identifier = identifier
        
        return self
    }
}

// MARK: - Constraints
public extension UILayoutGuide {
    
    /// Sets leading, trailing, top and bottom anchors equal to parent view's anchors
    /// - Parameters:
    ///   - parentView: a view on which current view (child view) needs to be constrained
    ///   - margin: margin around the constraints
    /// - Returns: current view
    @discardableResult
    func allAnchorsSame(on parentView: UIView,
                        margin: UIEdgeInsets = .zero) -> Self {
        self.leading(with: parentView.leadingAnchor, margin: margin.left)
            .trailing(with: parentView.trailingAnchor, margin: margin.right)
            .top(with: parentView.topAnchor, margin: margin.top)
            .bottom(with: parentView.bottomAnchor, margin: margin.bottom)
        
        return self
    }
    
    /// Sets leading anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as leading anchor on current view
    ///   - relation: relation between current view and relative contraint
    ///   - margin: leading margin / left margin from current view
    /// - Returns: current view
    @discardableResult
    func leading(with anchor: NSLayoutXAxisAnchor,
                 relation: ConstraintRelation = .equal,
                 margin: CGFloat = .zero) -> Self {
        let leadingAnchor = self.leadingAnchor.constraint(with: relation, on: anchor, margin: margin)
        self.setConstraintIdentifier(for: .leading, for: leadingAnchor)
        
        leadingAnchor.isActive = true
        
        return self
    }
    
    /// Sets trailing anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as trailing anchor on current view
    ///   - relation: relation between current view and relative contraint
    ///   - margin: trailing margin / right margin from current view
    /// - Returns: current view
    @discardableResult
    func trailing(with anchor: NSLayoutXAxisAnchor,
                  relation: ConstraintRelation = .equal,
                  margin: CGFloat = .zero) -> Self {
        let trailingAnchor = self.trailingAnchor.constraint(with: relation, on: anchor, margin: -margin)
        self.setConstraintIdentifier(for: .trailing, for: trailingAnchor)
        
        trailingAnchor.isActive = true
        
        return self
    }
    
    /// Sets top anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as top anchor on current view
    ///   - relation: relation between current view and relative contraint
    ///   - margin: top margin from current view
    /// - Returns: current view
    @discardableResult
    func top(with anchor: NSLayoutYAxisAnchor,
             relation: ConstraintRelation = .equal,
             margin: CGFloat = .zero) -> Self {
        let topAnchor = self.topAnchor.constraint(with: relation, on: anchor, margin: margin)
        self.setConstraintIdentifier(for: .top, for: topAnchor)
        
        topAnchor.isActive = true
        
        return self
    }
    
    /// Sets bottom anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as bottom anchor on current view
    ///   - relation: relation between current view and relative contraint
    ///   - margin: bottom margin from current view
    /// - Returns: current view
    @discardableResult
    func bottom(with anchor: NSLayoutYAxisAnchor,
                relation: ConstraintRelation = .equal,
                margin: CGFloat = .zero) -> Self {
        let bottomAnchor = self.bottomAnchor.constraint(with: relation, on: anchor, margin: -margin)
        self.setConstraintIdentifier(for: .bottom, for: bottomAnchor)
        
        bottomAnchor.isActive = true
        return self
    }
    
    /// Sets width and heoght anchor with given value on current view
    /// - Parameters:
    ///   - width: width value
    ///   - height: height value
    /// - Returns: current view
    @discardableResult
    func with(width: CGFloat? = nil,
              height: CGFloat? = nil) -> Self {
        
        if let safeWidth = width {
            let widthAnchor = self.widthAnchor.constraint(equalToConstant: safeWidth)
            self.setConstraintIdentifier(for: .width, for: widthAnchor)
            
            widthAnchor.isActive = true
        }
        
        if let safeHeight = height {
            let heightAnchor = self.heightAnchor.constraint(equalToConstant: safeHeight)
            self.setConstraintIdentifier(for: .height, for: heightAnchor)
            
            heightAnchor.isActive = true
        }
        
        return self
    }
    
    /// Sets centerX anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as centerX anchor on current view
    ///   - margin: margin from current view on X-axis
    /// - Returns: current view
    @discardableResult
    func centerX(with anchor: NSLayoutXAxisAnchor,
                 margin: CGFloat = .zero) -> Self {
        let centerXAnchor = self.centerXAnchor.constraint(equalTo: anchor, constant: margin)
        self.setConstraintIdentifier(for: .centerX, for: centerXAnchor)
        
        centerXAnchor.isActive = true
        
        return self
    }
    
    /// Sets centerY anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as centerY anchor on current view
    ///   - margin: margin from current view on Y-axis
    /// - Returns: current view
    @discardableResult
    func centerY(with anchor: NSLayoutYAxisAnchor,
                 margin: CGFloat = .zero) -> Self {
        let centerYAnchor = self.centerYAnchor.constraint(equalTo: anchor, constant: margin)
        self.setConstraintIdentifier(for: .centerY, for: centerYAnchor)
        
        centerYAnchor.isActive = true
        
        return self
    }
    
    /// Sets center (X & Y) anchor of the current view to provided anchor
    /// - Parameters:
    ///   - anchor: anchor value, which will be applied as centerX & centerY anchor on current view
    ///   - size: with and height value for current view
    /// - Returns: current view
    @discardableResult
    func center(on parentView: UIView,
                with size: CGSize) -> Self {
        self.centerX(with: parentView.centerXAnchor)
            .centerY(with: parentView.centerYAnchor)
            .with(width: size.width, height: size.height)
        
        return self
    }
    
}

public extension UILayoutGuide {
    
    func setConstraintIdentifier(for anchorType: AnchorType, for constraint: NSLayoutConstraint) {
        if self.identifier.isEmpty { return }
        
        constraint.identifier = anchorType.generateIdentifier(with: self.identifier)
    }
    
}
