//
//  FlattenTests.swift
//  FlattenTests
//
//  Created by Seyithan Teymur on 28/07/15.
//  Copyright © 2015 Brokoli. All rights reserved.
//

import XCTest
@testable import Flatten

class FlattenTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testEmptyArray() {
        let emptyArray = [NSObject]()
        XCTAssertEqual(emptyArray.flattened(), emptyArray, "Flattened empty array should equal to an empty array")
    }
    
    func testFlatArray() {
        XCTAssertEqual([1, 2, 3, 4].flattened(), [1, 2, 3, 4], "An already flattened array flattened again should equal to itself")
    }
    
    func testArbitrarilyNestedIntegerArray() {
        XCTAssertEqual([[1, 2], [3], 4].flattened(), [1, 2, 3, 4])
        XCTAssertEqual([[[1]], 2, 3, 4, [[[[[5]]], 6]]].flattened(), [1, 2, 3, 4, 5, 6])
    }
    
    func testSingleNestedArray() {
        XCTAssertEqual([[[1]]].flattened(), [1])
    }
    
    func testMultipleEquallyDeepNestedArrays() {
        XCTAssertEqual([[1], [2]].flattened(), [1, 2])
    }
    
    func testArrayOfMultipleTypes() {
        XCTAssertEqual([1, [[2]], "ohai", [3, 4]].flattened(), [1, 2, "ohai", 3, 4])
    }
    
    func testNestedEmptyArray() {
        let emptyArray = [NSObject]()
        XCTAssertEqual([emptyArray].flattened(), emptyArray)
    }
    
    // Just to make sure ;)
    func testIntercomBlogExample() {
        XCTAssertEqual([[1,2,[3]],4].flattened(), [1,2,3,4])
    }
    
}
