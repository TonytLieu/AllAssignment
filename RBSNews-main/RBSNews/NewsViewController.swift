//
//  NewsViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    
    var newsViewModel: NewsViewModel?
    var articles: [Article]?
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News screen"
        newsViewModel = NewsViewModel()
        newsViewModel?.parseJSON({ [weak self] (news) in
            self?.articles = news?.articles
            self?.newsTableView.reloadData()
        })
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articles else {
            return 0
        }
        return articles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        if let article = articles?[indexPath.row] {
            if let source = article.source, let title = article.title {
                cell.setupNewsCell(source: source.name, title: title)
            }
            if let imageUrl = article.urlToImage {
                cell.setupNewsImage(imageURL: imageUrl)
            }
        }
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = articles?[indexPath.row],
           let urlString = article.url,
           let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
            safariViewController.delegate = self
        } else {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "No Page Content Available", message: "Could not fetch the page content.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            }
        }
    }
}

extension NewsViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
