//
//  AppData.swift
//  Poeterator
//
//  Created by Student on 3/4/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import Foundation
import UIKit

class appData{
    //MARK: - ivars -
    static let shared = appData() //single instance as class constant
    var Alltypes = [WordList]()
    let typeKey = "typeKey"
    var selectedType:String = "generic" {
        didSet{
            print("Set type default")
            let defaults = UserDefaults.standard
            defaults.set(selectedType, forKey: typeKey)
        }
    }
    let wordKey = "wordKey"
    var selectedWords:[String] = [] {
        didSet{
            print("Set word default")
            let defaults = UserDefaults.standard
            defaults.set(selectedWords, forKey: wordKey)
        }
    }
    
    //MARK: - Initialization -
    private init(){
        //private initializer
        print("Created app data")
        
        addWordLists();
        
        readDefaultsData()
        //selectedType = Alltypes[0].type
        //selectedWords = Alltypes[0].words
        
    }
    
    //MARK: - Default Loading -
    private func readDefaultsData(){
        let defaults = UserDefaults.standard
        
        if let t = defaults.object(forKey: typeKey){
            selectedType = t as! String
        } else{
            selectedType = "generic"
        }
        
        if let w = defaults.object(forKey: wordKey){
            selectedWords = w as! [String]
        } else{
            selectedWords = Alltypes[0].words
        }
        
        print("read in defaults of \(selectedType)")
    }
    
    //MARK: - ACTING AS DATA SOURCE -
    private func addWordLists(){
        Alltypes.append(WordList(type: "Classic", words: [" away ", " chant ", " after ", " a ", " she ", " he ", " they ", " jump ", " swim ", " dream ", " leap ", " keep ", " ing ", " s ", " es ", " you ", " me ", " they ", " under ", " over ", " twilight ", " ly ", " light ", " wistful ", " ed ", " laughter ", " run ", " hope ", " clear ", " morose ", " drop ", " found ", " search ", " quiet ", " loud ", " sigh ", " time ", " face ", "  eyes ", " years ", " left ", " sky ", " years ", " long ", " man ", " women ", " wind ", " wings ", " air ", " dead ", " heart ", " sun ", " wind ", " sun ", " moon ", " youth ", " age ", " wisdom ", " alone ", " together ", " swing ", " gaze ", " touch ", " gentle ", " stiff ", " stale ", " breathe "]))
        Alltypes.append(WordList(type: "Top Words", words: [" the ", " be ", " to ", " in ", " have ", " I ", " with ", " he ", " she ", " they ", " will ", " what ", " about ", " who ", " out ", " my ", " one ", " from ", " up ", " when ", " people ", " know ", " some ", " could ", " then ", " now ", " only ", " look ", " just ", " make ", " also ", " back ", " want ", " because ", " any ", " these ", " give ", " point ", "  eyes ", " years ", " left ", " sky ", " years ", " long ", " man ", " women ", " wind ", " wings ", " air ", " government ", " world ", " problem ", " fact ", " group ", " every ", " hand ", " day ", " find ", " ask ", " leave ", " try ", " call ", " different ", " important ", " would ", " their ", " say "]))
        Alltypes.append(WordList(type: "Merriam Popular", words: [" socialism ", " sycophant ", " crosshair ", " culture ", " racism ", " love ", " sentiment ", " considered ", " communication ", " empathy ", " justice ", " ethic ", " diversity ", " persecute ", " synonym ", " allow ", " pragmatic ", " bigot ", " comradery ", " facism ", " integrity ", " holistic ", " feminism ", " serendipity ", " paradigm ", " pedantic ", " irony ", " hypocrite ", " albeit ", " metaphor ", " pretentious ", " perdition ", " trenchant ", " churlish ", " oblivious ", " prejudice ", " trope ", " aesthetic ", " family ", " scrappy "]))
    }
    
}
