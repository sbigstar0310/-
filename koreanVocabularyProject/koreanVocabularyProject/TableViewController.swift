//
//  TableViewController.swift
//  koreanVocabularyProject
//
//  Created by 성대규 on 10/26/23.
//

import UIKit

class TableViewController : UITableViewController {
    var list: [WordVO] = []
    var word: String = ""
    var total_num: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(word)
        let url: String = "https://stdict.korean.go.kr/api/search.do?key=6CFC0A4C0B377A588182A63EB76BC7DF&q=\(word)&req_type=json&start=1&num=10&advanced=n"
        let apiURL: URL! = URL(string: url)
        let apidata = try! Data(contentsOf: apiURL)
        let apiDictionary = try? JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
        let log = String(data: apidata, encoding: String.Encoding.utf8)
        print(log ?? "")
        
        let channel = apiDictionary!["channel"] as! NSDictionary
        total_num = (channel["total"] as? Int)! > 10 ? 10 : channel["total"] as? Int
        let item = channel["item"] as! NSArray
        
        for i in 0 ..< total_num! {
            let wordList = item[i] as! NSDictionary
            let sense = wordList["sense"] as! NSDictionary
            let word:WordVO = WordVO()
            
            word.no = Int((wordList["sup_no"] as? String)!)
            word.word = wordList["word"] as? String
            word.definition = sense["definition"] as? String
//            print("no: \(word.no)")
//            print("word: \(word.word)")
//            print("word: \(word.definition)")
            self.list.append(word)
        }
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowsNum = total_num else {
            return 0
        }
        return rowsNum
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: WordVO = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as! TableViewCell
        print("no: \(row.no)")
        print("word: \(row.word)")
        print("word: \(row.definition)")
        cell.definition?.numberOfLines = 10
        cell.definition?.text = row.definition
        cell.name?.text = row.word
        cell.number?.text = String(row.no!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let VC = segue.destination as? DetailViewController
            let cell = segue.source as? TableViewCell
            VC?.passedNum = cell?.number.text
            VC?.passedWord = cell?.name.text
            VC?.passedDefinition = cell?.definition.text
        }
    }
}
