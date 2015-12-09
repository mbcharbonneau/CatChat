//
//  CatChatTests.swift
//  CatChatTests
//
//  Created by Marc Charbonneau on 12/9/15.
//  Copyright © 2015 OnceLiving. All rights reserved.
//

import XCTest
@testable import CatChat

class CatChatTests: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    var viewController: TranslationsViewController?
    var testCat: Cat?
    
    override func setUp() {
        super.setUp()

        let navController = storyboard.instantiateInitialViewController() as? UINavigationController
        testCat = Cat("Test Cat")
        viewController = navController?.topViewController as? TranslationsViewController
        viewController!.cat = testCat!
    }
    
    func testSegueSetup() {
        
        let destination = storyboard.instantiateViewControllerWithIdentifier("TextEntry") as? TextEntryViewController
        let segue = UIStoryboardSegue(identifier: "ShowTextEntry", source: viewController!, destination: destination!)
        
        viewController?.prepareForSegue(segue, sender: nil)
        
        XCTAssertNotNil(destination?.cat)
    }
}
