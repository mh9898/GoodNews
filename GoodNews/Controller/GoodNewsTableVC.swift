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
    
    func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
