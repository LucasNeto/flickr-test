//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by Lucas  N Santana on 15/06/24.
//

import XCTest
@testable import Flickr

final class FlickrTests: XCTestCase {

    var sut: String?
    
    override func setUpWithError() throws {
        sut = ""
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSimpleConversion() throws {
        //given
        sut = "2024-06-17T04:01:01Z"
        
        //when
        let formatted = sut?.dateFormatted
        
        //then
        assert(formatted == "17/06 - 01h01") //Timezone difference
    }
    
    func testConversionOtherFormat() throws {
        //given
        sut = "2024-06-17T04:01:01Z"
        
        //when
        let formatted = sut?.dateFormat(format: "YYY, MMM, dd")
        
        //then
        assert(formatted == "2024, Jun, 17") //Timezone difference
    }

    func testConversionChanginBaseFormat() throws {
        //given
        sut = "2024-06-17"
        
        //when
        let formatted = sut?.dateFormat(format: "YYY, MMM, dd", baseFormat: "yyyy-MM-dd")
        
        //then
        assert(formatted == "2024, Jun, 17") //Timezone difference
    }

}
