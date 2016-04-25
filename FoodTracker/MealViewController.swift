//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Mario Ban on 17.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, /* protocols */ UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  // MARK: Properties

  @IBOutlet weak var nameTextField: UITextField!
  //@IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  @IBOutlet weak var saveButton: UIBarButtonItem!

  /*
   This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
   or constructed as part of adding a new meal.
   */
  var meal: Meal?

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
    //mealNameLabel.text = textField.text
  }

  // MARK: UIImagePickerControllerDelegate

  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    // Dismiss the picker if the user canceled.
    dismissViewControllerAnimated(true, completion: nil)
  }

  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    // The info dictionary contains multiple representations of the image, and this uses the original.
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage

    // Set photoImageView to display the selected image.
    photoImageView.image = selectedImage

    // Dismiss the picker.
    dismissViewControllerAnimated(true, completion: nil)
  }

  // MARK: Navigation

  // This method lets you configure a view controller before it's presented.
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if saveButton === sender {
      let name = nameTextField.text ?? ""
      let photo = photoImageView.image
      let rating = ratingControl.rating

      // Set the meal to be passed to MealTableViewController after the unwind segue.
      meal = Meal(name: name, photo: photo, rating: rating)
    }
  }

  // MARK: Actions

  @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
    // Hide the keyboard (just in case).
    nameTextField.resignFirstResponder()

    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()

    // Only allow photos to be picked, not taken.
    imagePickerController.sourceType = .PhotoLibrary

    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self

    presentViewController(imagePickerController, animated: true, completion: nil)
  }

  /*
  @IBAction func setDefaultLabelText(sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }
  */

}
