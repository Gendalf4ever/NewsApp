//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Master on 29.09.2021.
//

import UIKit

class NewsViewController: UIViewController {

    var article: Article!
    override func viewDidLoad() {
        titleView.text = article.title
        descriptionLabel.text = article.description
    }
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
   
    
    @IBAction func openActionButton(_ sender: Any) {
    }
    
    
    
    /*
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
