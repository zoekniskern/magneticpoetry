//
//  ViewController.swift
//  Poeterator
//
//  Created by Zoe Kniskern (RIT Student) on 2/2/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - ivars -
    var backgroundImage:UIImage?
    
    //MARK: - Initialization -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeWords(words: appData.shared.selectedWords)
        //placeWords(words: types[0].words)
    }
    
    //MARK: - Place Words -
    //place words
    //takes array of words
    func placeWords(words: [String]){
        let wid = self.view.frame.size.width
        let hei = self.view.frame.size.height
        //print("height is \(hei)")
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
            //https://stackoverflow.com/questions/1709131/iphone-uilabel-text-soft-shadow
            l.layer.shadowColor = UIColor.black.cgColor
            l.layer.shadowRadius = 3.5
            l.layer.shadowOpacity = 0.5
            l.layer.shadowOffset = CGSize(width: 2, height: 2)
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
                
                if(y < hei/3){
                    //limit amount of words on screen
                    y = y + l.frame.size.height + padding
                    //print("y value = \(y)")
                } else{
                    break
                }
            }
            
            l.frame.origin = CGPoint(x:x, y:y)
            view.addSubview(l)
            
            //move past the next word
            if(x + l.frame.size.width + padding < wid) {
                x = x + l.frame.size.width + padding
                //print("the x is now \(x)")
            } else { //this loop may do nothing
                x = 20
                //print("to the next line second loop")
                y = y + l.frame.size.height + padding
            }
        
            //draggable
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            //Add the recognizer to your view.
            l.addGestureRecognizer(tapRecognizer)
        }
    }
    
    //MARK: - Button Actions -
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
            //let typeVC = segue.source as! WordTypeVC
            let type = appData.shared.selectedType //ypeVC.selectedType
            let words = appData.shared.selectedWords //typeVC.selectedWords
            print(type)
            
            //DELETE WORDS
            clearWords()
            
            //CHANGE WORDS
            placeWords(words: words)
        }
    }
    
    //SHARE BUTTON
    @IBAction func share(_sender:AnyObject) {
        let textToShare = "Check out the poem I created with Poeterator!"
        let image = self.view.takeSnapshot()
        let zoeGitHub = NSURL(string: "https://github.com/zoekniskern/magneticpoetry")
        let objectsToShare:[AnyObject] = [textToShare as AnyObject, zoeGitHub!, image!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.print]
        //iPad
        let popoverMenuViewController = activityVC.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = .any
        popoverMenuViewController?.barButtonItem = _sender as? UIBarButtonItem
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //CAMERA BUTTON
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: - UIImagePickerController Delegate Methods -
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("finished picking")
        print(info)
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        backgroundImage = image
        
        (self.view as! UIImageView).contentMode = .center
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - GestureRecognizer Action Methods -
    //control touch events
    @objc func doPanGesture(panGesture: UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    @objc func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        //tappedImageView will be the image view that was tapped.
        //dismiss it, animate it off screen, whatever.
        let tappedUILabel = gestureRecognizer.view as! UILabel
        print("label selected: \(String(describing: tappedUILabel.text))")
    }
    
    //MARK: - Handles Segue -
    //override for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "setWordType"{
            let typesVC = segue.destination.children[0] as! WordTypeVC
            typesVC.title = "Choose a Word Set"
        }
    }
    
    //MARK: - Hide Status Bar -
    //hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

