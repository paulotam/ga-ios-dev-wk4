//
//  animalsTableViewController.swift
//  week3Assignment
//
//  Created by Paulo Tam on 24/04/2016.
//  Copyright © 2016 Paulo Tam. All rights reserved.
//

import UIKit

class PairViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate, UITextFieldDelegate {

  //@IBOutlet var animalTable: UITableView!
  @IBOutlet weak var pairTable: UITableView!
  @IBOutlet weak var keyField: UITextField!
  @IBOutlet weak var valueField: UITextField!

  var dataMap: [[String:String]]?

  override func viewDidLoad() {
    super.viewDidLoad()

    // not required when added via the Interface Builder.
    //    listTable.delegate = self
    //    listTable.dataSource = self
    //    textField.delegate = self
    dataMap = [[String:String]]()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  func textFieldShouldReturn(textField: UITextField) -> Bool {

    guard keyField.text!.characters.count > 0 else { return true }
    guard valueField.text!.characters.count > 0 else { return true }

    addItem(keyField.text!, newValue: valueField.text!)
    textField.resignFirstResponder()
    keyField.text = ""
    valueField.text = ""
    return true
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let dataMap = dataMap else {
      return 0
    }
    return dataMap.count
  }

  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    guard let dataMap = dataMap else {
      return UITableViewCell()
    }

    guard let cell = pairTable.dequeueReusableCellWithIdentifier(
      "pairCell", forIndexPath: indexPath) as? PairTableViewCell else {
       return UITableViewCell()
    }

    let dictionary = dataMap[indexPath.row]
    let key = dictionary.keys.first!
    cell.keyField.text = key
    cell.valueField.text = dictionary[key]
    return cell
  }

  func addItem (newKey: String, newValue: String) {
//    print("addItem")
    dataMap?.append([newKey: newValue])
    pairTable.reloadData()
  }

}
