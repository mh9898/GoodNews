//
//  GoodNewsTableVC.swift
//  GoodNews
//
//  Created by MiciH on 6/13/21.
//

import UIKit

class GoodNewsTableVC: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=il&apiKey=8956235201f942da9134c4969ca0ff3a")!
        
        WebService().getArticle(url: url) { (articles) in
            print(articles?.first)
        }
        
    }
}
