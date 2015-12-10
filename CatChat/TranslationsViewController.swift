//
//  ViewController.swift
//  CatChat
//
//  Created by Marc Charbonneau on 12/9/15.
//  Copyright © 2015 OnceLiving. All rights reserved.
//

import UIKit

class TranslationsViewController: UITableViewController {

    var dataSource = [String]()
    var cat = Cat("Mr. Whiskers")
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Talking to " + cat.name
        
        self.dataSource.append(cat.translate("hello there cat"))
        self.dataSource.append(cat.translate("what do you have to say"))
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CatCell", forIndexPath: indexPath)
        guard let label = cell.contentView.subviews.first as? UILabel else { fatalError("cell not configured!") }
        label.text = dataSource[indexPath.row]
        return cell
    }
    
    // MARK: Unwind Segue

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? TextEntryViewController {
            destination.cat = cat
        }
    }
    
    @IBAction func unwindToTranslations(segue: UIStoryboardSegue) {
        
        guard let viewController = segue.sourceViewController as? TextEntryViewController else { fatalError("invalid view controller!") }
        guard let string = viewController.string else { fatalError("no text!") }
        let translation = self.cat.translate(string)
        let index = NSIndexPath(forRow: self.dataSource.count, inSection: 0)
        self.dataSource.append(translation)
        self.tableView.insertRowsAtIndexPaths([index], withRowAnimation: .Automatic)
    }
}
