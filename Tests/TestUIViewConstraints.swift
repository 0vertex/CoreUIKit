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
    }
    
    func test_UIView_allAnchorsSame() {
        
        self.sut
            .add(to: self.parentView)
            .allAnchorsSame(on: self.parentView)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.parentView.constraints.count, 4)
        
        XCTAssertNotNil(self.parentView.constraints.first(where: { $0.identifier == "\(self.sutViewId)_leadingAnchor" }))
        XCTAssertNotNil(self.parentView.constraints.first(where: { $0.identifier == "\(self.sutViewId)_trailingAnchor" }))
        XCTAssertNotNil(self.parentView.constraints.first(where: { $0.identifier == "\(self.sutViewId)_topAnchor" }))
        XCTAssertNotNil(self.parentView.constraints.first(where: { $0.identifier == "\(self.sutViewId)_bottomAnchor" }))
    }
    
}
