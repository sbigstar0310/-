//
//  TableViewCell.swift
//  koreanVocabularyProject
//
//  Created by 성대규 on 10/26/23.
//

import UIKit

class TableViewCell : UITableViewCell {
    
    @IBOutlet var number: UILabel!
    
    @IBOutlet var name: UILabel!

    @IBOutlet var definition: UILabel!
    
    @IBAction func moveInfoPage(_ sender: Any) {
    }
}
