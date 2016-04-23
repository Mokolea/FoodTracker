//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Mario Ban on 21.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

import UIKit

class RatingControl: UIView {

  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
    // Drawing code
  }
  */

  // MARK: Initialization
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
    button.backgroundColor = UIColor.redColor()

    button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)

    addSubview(button)
  }
  override func intrinsicContentSize() -> CGSize {
    return CGSize(width: 240, height: 44)
  }

  // MARK: Button Action
  func ratingButtonTapped(button: UIButton) {
    print("Button pressed 👍")
  }

}
