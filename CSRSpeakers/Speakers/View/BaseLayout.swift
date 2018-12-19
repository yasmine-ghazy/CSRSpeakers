//
//  BaseLayout.swift
//  CSRSpeakers
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
import UIKit

public class BaseLayout {
    
    var superview: UIView!
    
    init(superview: UIView) {
        self.superview = superview
        superview.backgroundColor = .white
    }
}
