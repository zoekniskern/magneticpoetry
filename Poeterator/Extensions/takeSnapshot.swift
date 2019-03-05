//
//  takeSnapshot.swift
//  Poeterator
//
//  Created by Student on 3/4/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func takeSnapshot() -> UIImage? {
        //        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        //        drawHierarchy(in: bounds, afterScreenUpdates: true)
        //        let image = UIGraphicsGetImageFromCurrentImageContext()
        //        UIGraphicsEndImageContext()
        //        return image
        
        //later answer in this thread
        //https://stackoverflow.com/questions/2214957/how-do-i-take-a-screen-shot-of-a-uiview
        
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        return renderer.image {
            (context) in self.layer.render(in: context.cgContext)
        }
    }
    
}
