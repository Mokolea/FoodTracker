//
//  ViewController.swift
//  FoodTracker
//
//  Created by Mario Ban on 17.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

import UIKit

class ViewController: UIViewController, /*protocol*/ UITextFieldDelegate {

  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    // Handle the text field’s user input through delegate callbacks.
    nameTextField.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.

  }

  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
  }
  func textFieldDidEndEditing(textField: UITextField) {
    mealNameLabel.text = textField.text
  }

  // MARK: Actions
  @IBAction func setDefaultLabelText(sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }

}
