//
//  GoodNewsTableVC.swift
//  GoodNews
//
//  Created by MiciH on 6/13/21.
//

import UIKit

class GoodNewsTableVC: UITableViewController {
    
    //TODO: Change to optional
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureArticlesWebRequest()
        configureTableView()
    }
    
    private func configureUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.subviews[1].semanticContentAttribute = .forceRightToLeft
        
        title = "No Fake News 🇮🇱"
    }
    
    private func configureArticlesWebRequest(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=il&apiKey=8956235201f942da9134c4969ca0ff3a")!
        
        WebService().getArticle(url: url) { (articles) in
            print(articles ?? [])
            if let articles = articles{
                //init(load, pass) the articles -> articleListVM
                self.articleListVM = ArticleListViewModel(articles: articles)
                //load our table view
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func configureTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleCell else{
            fatalError("dequeueReusableCell name is not correct")
        }
        let articleVM = articleListVM.articleAt(index: indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
}
