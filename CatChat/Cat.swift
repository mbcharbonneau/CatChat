//
//  Cat.swift
//  CatChat
//
//  Created by Marc Charbonneau on 12/9/15.
//  Copyright © 2015 OnceLiving. All rights reserved.
//

import Foundation

struct Cat {
    
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func translate(human: String) -> String {
        let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let words = human.componentsSeparatedByCharactersInSet(whitespace)
        let meows = words.map({ _ in return "meow" })
        return "😸 " + meows.joinWithSeparator(" ") + "!"
    }
}