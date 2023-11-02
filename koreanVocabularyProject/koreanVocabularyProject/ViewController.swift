//
//  ViewController.swift
//  koreanVocabularyProject
//
//  Created by 성대규 on 10/25/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.searchBar.delegate = self
    }


    @IBOutlet var searchBar: UISearchBar!
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let text = self.searchBar.text else { return }
        
        let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "tableVC") as! TableViewController
        tableVC.word = text
        
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    
    // key = 6CFC0A4C0B377A588182A63EB76BC7DF
    // https://stdict.korean.go.kr/api/search.do
    /*
     q = 단어
     req_type = json
     start = 1
     num = 10
     advanced = n
     */
}
