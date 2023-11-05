//
//  DetailViewController.swift
//  koreanVocabularyProject
//
//  Created by 성대규 on 11/2/23.
//
import UIKit

class DetailViewController : UIViewController {
    override func viewDidLoad() {
        exampleTableView.delegate = self
        exampleTableView.dataSource = self
        
        print(passedNum)
        print(passedWord)
        print(passedDefinition)
        num.text = passedNum
        word.text = passedWord
        definition.text = passedDefinition
    }
    
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

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
