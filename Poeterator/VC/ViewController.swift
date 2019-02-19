//
//  ViewController.swift
//  Poeterator
//
//  Created by Zoe Kniskern (RIT Student) on 2/2/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let generic = [" away ", " chant ", " after ", " a ", " she ", " he ", " they ", " jump ", " swim ", " dream ", " leap ", " keep ", " ing ", " s ", " es ", " you ", " me ", " they ", " under ", " over ", " twilight ", " ly ", " light ", " wistful ", " ed "]
    
    var types = [WordList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeWords(words: generic)
        
        //placeWords(words: types[0].words)
    }
    
    //place words
    //takes array of words
    func placeWords(words: [String]){
        let wid = self.view.frame.size.width
        //let hei = self.view.frame.size.height
        view.backgroundColor = UIColor(red:0.90, green:0.93, blue:0.94, alpha:1.0)
        var x:CGFloat = 20
        var y:CGFloat = 40
        let padding:CGFloat = 10
        
        for word in words{
            //display
            let l = UILabel()
            //white background for magnet
            l.backgroundColor = UIColor.white
            //magnet text is centered
            l.textAlignment = NSTextAlignment.center
            //magnet is the word in the array
            l.text = word
            //handle magnet font size based on device
            //https://stackoverflow.com/questions/24059327/detect-current-device-with-ui-user-interface-idiom-in-swift
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
            // It's an iPhone
                l.font = UIFont.systemFont(ofSize: 17)
            case .pad:
            // It's an iPad
                l.font = UIFont.systemFont(ofSize: 30)
            case .unspecified:
                // Uh, oh! What could it be?
                l.font = UIFont.systemFont(ofSize: 12)
            case .tv:
                l.font = UIFont.systemFont(ofSize: 12)
            case .carPlay:
                l.font = UIFont.systemFont(ofSize: 12)
            }
            
            l.frame.size.height = l.intrinsicContentSize.height + 20
            l.frame.size.width = l.intrinsicContentSize.width + 20
            //l.sizeToFit()
            //let x = CGFloat(arc4random() % 280) + 20.0
            //let y = CGFloat(arc4random() % 300) + 30.0
            
            //if this word is going to go off the screen, move to the next row
            if(x + l.frame.size.width + padding > wid) {
                x = 20
                y = y + l.frame.size.height + padding
                print("to the next line")
            }
            
            l.frame.origin = CGPoint(x:x, y:y)
            view.addSubview(l)
            
            //move past the next word
            if(x + l.frame.size.width + padding < wid) {
                x = x + l.frame.size.width + padding
                print("the x is now \(x)")
            } else {
                x = 20
                y = y + l.frame.size.height + padding
                print("to the next line")
            }
        
            //draggable
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
        }
    }
    
    //delete words func
    func clearWords(){
        for v in view.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
    }
    
    //clear button action
    @IBAction func clearTapped(){
        clearWords()
    }
    
    //DONE BUTTON
    @IBAction func unwindToMain(segue:UIStoryboardSegue){
        if segue.identifier == "TypeDoneTapped"{
            let typeVC = segue.source as! WordTypeVC
            let type = typeVC.selectedType
            let words = typeVC.selectedWords
            print(type)
            
            //DELETE WORDS
            clearWords()
            
            //CHANGE WORDS
            placeWords(words: words)
        }
    }
    
    //control touch events
    @objc func doPanGesture(panGesture: UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    //override for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "setWordType"{
            let typesVC = segue.destination.children[0] as! WordTypeVC
            typesVC.title = "Choose a Word Set"
        }
    }

}

