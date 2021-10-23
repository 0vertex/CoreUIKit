//
//  TestUIViewConstraints.swift
//  CoreUIKitTests
//
//  Created by Manish on 19/09/21.
//

@testable import CoreUIKit
import XCTest

class TestUIViewConstraints: XCTestCase {
    
    private var sut: UIView!
    private var parentView: UIView!
    
    private let sutViewId = "sut_View"
    private let parentViewId = "parent_View"
    private let leadingAnchorExt = "_leadingAnchor"
    
    override func setUp() {
        super.setUp()
        
        self.sut = UIView()
        self.sut.set(identifier: sutViewId)
        self.parentView = UIView()
        self.parentView.set(identifier: parentViewId)
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
        self.parentView = nil
    }
    
}

extension TestUIViewConstraints {
    
    func test_UIView_addInVCView() {
        
        self.sut
            .add(to: self.parentView)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        
    }
    
    func test_UIView_addInVCView_WithSameSize() {
        
        self.sut
            .add(to: self.parentView)
            .allAnchorsSame(on: self.parentView)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.sut.bounds, self.parentView.bounds)
    }
    
    func test_UIView_addInVCView_FixedWidthAndHeight() {
        
        let fixedSize: CGFloat = 200
        
        self.sut
            .add(to: self.parentView)
            .with(width: fixedSize, height: fixedSize)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.sut.constraints.count, 2)
        
        let widthAnchor = self.sut.constraints.first(where: { $0.identifier == AnchorType.width.generateIdentifier(with: self.sutViewId) })
        let heightAnchor = self.sut.constraints.first(where: { $0.identifier == AnchorType.height.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(widthAnchor)
        XCTAssertNotNil(heightAnchor)
        
        XCTAssertEqual(widthAnchor?.constant, fixedSize)
        XCTAssertEqual(heightAnchor?.constant, fixedSize)
    }
    
    func test_UIView_allAnchorsSame() {
        
        self.sut
            .add(to: self.parentView)
            .allAnchorsSame(on: self.parentView, margin: 5.toUIEdgeInsets)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 4)
        
        let leadingAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.leading.generateIdentifier(with: self.sutViewId) })
        let trailingAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.trailing.generateIdentifier(with: self.sutViewId) })
        let topAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.top.generateIdentifier(with: self.sutViewId) })
        let bottomAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.bottom.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(leadingAnchor)
        XCTAssertEqual(leadingAnchor?.constant, 5.toCGFloat)
        XCTAssertNotNil(trailingAnchor)
        XCTAssertEqual(trailingAnchor?.constant, -5.toCGFloat)
        XCTAssertNotNil(topAnchor)
        XCTAssertEqual(topAnchor?.constant, 5.toCGFloat)
        XCTAssertNotNil(bottomAnchor)
        XCTAssertEqual(bottomAnchor?.constant, -5.toCGFloat)
    }
    
    func test_UIView_leadingAnchor() {
        
        self.sut
            .add(to: self.parentView)
            .leading(with: self.parentView.leadingAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let leadingAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.leading.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(leadingAnchor)
        XCTAssertEqual(leadingAnchor?.constant, 5.toCGFloat)
    }
    
    func test_UIView_trailingAnchor() {
        
        self.sut
            .add(to: self.parentView)
            .trailing(with: self.parentView.trailingAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let trailingAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.trailing.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(trailingAnchor)
        XCTAssertEqual(trailingAnchor?.constant, -5.toCGFloat)
    }
    
    func test_UIView_topAnchor() {
        
        self.sut
            .add(to: self.parentView)
            .top(with: self.parentView.topAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let topAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.top.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(topAnchor)
        XCTAssertEqual(topAnchor?.constant, 5.toCGFloat)
    }
    
    func test_UIView_bottomAnchor() {
        
        self.sut
            .add(to: self.parentView)
            .bottom(with: self.parentView.bottomAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let bottomAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.bottom.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(bottomAnchor)
        XCTAssertEqual(bottomAnchor?.constant, -5.toCGFloat)
    }
    
    func test_UIView_centerX() {
        
        self.sut
            .add(to: self.parentView)
            .centerX(with: self.parentView.centerXAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let centerXAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.centerX.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(centerXAnchor)
        XCTAssertEqual(centerXAnchor?.constant, 5.toCGFloat)
    }
    
    func test_UIView_centerY() {
        
        self.sut
            .add(to: self.parentView)
            .centerY(with: self.parentView.centerYAnchor, margin: 5)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 1)
        
        let centerYAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.centerY.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(centerYAnchor)
        XCTAssertEqual(centerYAnchor?.constant, 5.toCGFloat)
    }
    
    func test_UIView_center() {
        
        self.sut
            .add(to: self.parentView)
            .center(on: self.parentView, with: 10.toCGSize)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 2)
        XCTAssertEqual(self.sut.constraints.count, 2)
        
        let centerXAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.centerX.generateIdentifier(with: self.sutViewId) })
        let centerYAnchor = self.parentView.constraints.first(where: { $0.identifier == AnchorType.centerY.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(centerXAnchor)
        XCTAssertEqual(centerXAnchor?.constant, 0.toCGFloat)
        
        XCTAssertNotNil(centerYAnchor)
        XCTAssertEqual(centerYAnchor?.constant, 0.toCGFloat)
        
        let widthAnchor = self.sut.constraints.first(where: { $0.identifier == AnchorType.width.generateIdentifier(with: self.sutViewId) })
        let heightAnchor = self.sut.constraints.first(where: { $0.identifier == AnchorType.height.generateIdentifier(with: self.sutViewId) })
        
        XCTAssertNotNil(widthAnchor)
        XCTAssertNotNil(heightAnchor)
        
        XCTAssertEqual(widthAnchor?.constant, 10.toCGFloat)
        XCTAssertEqual(heightAnchor?.constant, 10.toCGFloat)
    }
    
}
