//
//  Meal.swift
//  FoodTracker
//
//  Created by Mario Ban on 24.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

//import Foundation
import UIKit

class Meal: NSObject, /* protocol */ NSCoding {

  // MARK: Properties

  var name: String
  var photo: UIImage?
  var rating: Int

  // MARK: Archiving Paths

  static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")

  // MARK: Types

  struct PropertyKey {
    static let nameKey = "name"
    static let photoKey = "photo"
    static let ratingKey = "rating"
  }

  // MARK: Initialization

  init?(name: String, photo: UIImage?, rating: Int) {
    // Initialize stored properties.
    self.name = name
    self.photo = photo
    self.rating = rating

    super.init() // Call superclass initializer

    // Initialization should fail if there is no name or if the rating is out of range.
    if name.isEmpty || rating < 0 || rating > 5 {
      return nil
    }
  }

  // MARK: NSCoding

  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
    aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
    aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
    // Because photo is an optional property of Meal, use conditional cast.
    let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
    let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)

    // Must call designated initializer.
    self.init(name: name, photo: photo, rating: rating)
  }

}
