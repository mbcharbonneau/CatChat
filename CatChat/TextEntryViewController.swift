//
//  TextEntryViewController.swift
//  CatChat
//
//  Created by Marc Charbonneau on 12/9/15.
//  Copyright © 2015 OnceLiving. All rights reserved.
//

import UIKit


class TextEntryViewController: UIViewController {
    
    var cat: Cat?
    
    @IBOutlet var helpLabel: UILabel?
    @IBOutlet var textField: UITextField?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpLabel?.text = "Enter human speech for \(cat!.name):"
    }

    // MARK: Unwind Segue
    
    var string: String?

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        switch identifier {
        case "AddTranslation":
            let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
            guard let string = textField?.text?.stringByTrimmingCharactersInSet(whitespace) where string.characters.count > 0 else {
                
                let alert = UIAlertController(title: "Empty Comment", message: "Type a reply to share with others!", preferredStyle: .Alert)
                let cancel = UIAlertAction(title: "Okay", style: .Cancel, handler:nil)
                alert.addAction(cancel)
                self.presentViewController(alert, animated: true, completion: nil)
                return false
            }
            return true
        default:
            return super.shouldPerformSegueWithIdentifier(identifier, sender: sender)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        string = textField?.text?.stringByTrimmingCharactersInSet(whitespace)
    }
}
