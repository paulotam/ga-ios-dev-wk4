//
//  animalsTableViewController.swift
//  week3Assignment
//
//  Created by Paulo Tam on 24/04/2016.
//  Copyright © 2016 Paulo Tam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate, UITextFieldDelegate {

  //@IBOutlet var animalTable: UITableView!

  @IBOutlet weak var listTable: UITableView!
  @IBOutlet weak var textField: UITextField!

  var defaultList: [String] = ["Tomatoes", "Onions"]

  override func viewDidLoad() {
    super.viewDidLoad()

//    listTable.delegate = self
//    listTable.dataSource = self
//    textField.delegate = self
    addItem("Lettuce")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    addItem(textField.text!)
    textField.resignFirstResponder()
    textField.text = ""
    return true
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return defaultList.count
  }

  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = listTable.dequeueReusableCellWithIdentifier(
      "arrayTableViewCell",
      forIndexPath: indexPath
      ) as? ArrayTableViewCell else {
      return UITableViewCell()
    }

    let row = indexPath.row
    cell.textCellLabel.text = defaultList[row]
    return cell
  }

  func addItem (value: String) {
//    print("addItem")
    defaultList.append(value)
    listTable.reloadData()
  }

}
