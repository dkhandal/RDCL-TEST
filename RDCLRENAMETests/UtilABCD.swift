//
//  UtilABCD.swift
//  ABCD
//
//  Created by Sujay Pidara on 5/24/16.
//  Copyright © 2016 RADICLE. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON

@testable import ABCD

class UtilABCD: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: - XCTestExpectation to wait for asynchronous processes
    func testLoadServerData(){
        //        let _ = vc.view
        //        vc.loadData()
        
        let urlString:String = "http://radicleinc.com/socialjack/socialjack_service/index.php/getSquad?appVersion=1.1"
        
        let expectation = expectationWithDescription("AFWrapper")
        
        AFWrapper.requestGETURL(urlString, success: {
            (JSONResponse) -> Void in
            
            print("JSONResponse: \(JSONResponse)" )
            
            XCTAssertNotNil(JSONResponse, "JSON Object is nil")
            
            XCTAssertTrue(JSONResponse["success"].boolValue, JSONResponse["message"].stringValue)
            
            
            expectation.fulfill()
        }) {
            (error) -> Void in
            print(error)
            XCTAssertNil(error, "Error: \(error.localizedDescription)")
            
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
        
        
        //        XCTAssertNil(jsonObj, "JSON Object is nil")
        
        
        //        let expectation = expectationWithDescription("Alamofire")
        //
        //        Alamofire.request(.GET, urlString)
        //            .response { request, response, data, error in
        //                XCTAssertNil(error, "Error: \(error)")
        //
        //                XCTAssertEqual(response?.statusCode, 200, "Status code not 200")
        //
        //                self.jsonObj = JSON(data!)
        //
        //                XCTAssertNotNil(self.jsonObj, "JSON Object is nil")
        //
        //                expectation.fulfill()
        //        }
        //
        //        waitForExpectationsWithTimeout(5.0, handler: nil)
    }

    
}
