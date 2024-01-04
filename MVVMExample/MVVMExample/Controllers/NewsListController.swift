//
//  NewsListController.swift
//  MVVMExample
//
//  Created by TUANLE5 on 05/01/2024.
//

import Foundation
import UIKit

class NewsListController: UITableViewController {
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsList()
    }
    
    private func getNewsList() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-12-04&sortBy=publishedAt&apiKey=9c400197385a43a68979a1491041ebf0")!
        
        APIService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}
