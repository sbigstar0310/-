//
//  DetailViewController.swift
//  koreanVocabularyProject
//
//  Created by 성대규 on 11/2/23.
//
import UIKit

class DetailViewController : UIViewController {
    var passedNum: String?
    var passedWord: String?
    var passedDefinition: String?
    
    @IBOutlet var num: UILabel!
    
    @IBOutlet var word: UILabel!
    
    
    @IBOutlet var definition: UILabel!
    
    
    @IBOutlet var exampleTableView: UITableView!
    
    @IBAction func addWordList(_ sender: UIButton) {
    }
}
