//
//  FontSizing.swift
//  Poeterator
//
//  Created by Student on 3/4/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func makeFontSmall(){
        self.font = UIFont(name: self.font.fontName, size: 10)
        self.sizeToFit()
    }
}
