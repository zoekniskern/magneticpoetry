//
//  ViewController.swift
//  Poeterator
//
//  Created by Zoe Kniskern (RIT Student) on 2/2/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let words = ["away", "chant", "after", "a", "she", "he", "they", "jump", "swim", "dream", "leap", "keep", "ing", "s", "es", "you", "me", "they", "under", "over", "twilight", "ly", "light", "wistful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeWords()
    }
    
    func placeWords(){
        view.backgroundColor = UIColor(red:0.90, green:0.93, blue:0.94, alpha:1.0)
        for word in words{
            //display
            let l = UILabel()
            l.backgroundColor = UIColor.white
            l.text = word
            l.sizeToFit()
            let x = CGFloat(arc4random() % 280) + 20.0
            let y = CGFloat(arc4random() % 300) + 30.0
            l.center = CGPoint(x:x, y:y)
            view.addSubview(l)
            
            //draggable
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
        }
    }
    
    @objc func doPanGesture(panGesture: UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }

}

