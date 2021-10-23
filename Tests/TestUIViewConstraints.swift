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
    
    override func setUp() {
        super.setUp()
        
        self.sut = UIView()
        self.sut.set(identifier: "sut_View")
        self.parentView = UIView()
        self.parentView.set(identifier: "parent_View")
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.sut = nil
        self.parentView = nil
    }
    
}

extension TestUIViewConstraints {
    
    func test_UIView_addInVCView_success() {
        
        self.sut
            .add(to: self.parentView)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        
    }
    
    func test_UIView_addInVCView_WithSameSize_success() {
        
        self.sut
            .add(to: self.parentView)
            .allAnchorsSame(on: self.parentView)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.sut.bounds, self.parentView.bounds)
    }
    
    func test_UIView_addInVCView_FixedWidthAndHeight_success() {
        
        let fixedSize: CGFloat = 200
        
        self.sut
            .add(to: self.parentView)
            .top(with: self.parentView.topAnchor)
            .leading(with: self.parentView.leadingAnchor)
            .with(width: fixedSize, height: fixedSize)
        
        XCTAssertTrue(self.sut.isDescendant(of: self.parentView))
        XCTAssertEqual(self.sut.bounds.width, fixedSize)
        XCTAssertEqual(self.sut.bounds.height, fixedSize)
    }
    
}
