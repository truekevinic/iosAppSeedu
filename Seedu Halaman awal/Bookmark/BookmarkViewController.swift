//
//  BookmarkViewController.swift
//  Seedu Halaman awal
//
//  Created by jona on 13/04/21.
//

import UIKit
import CoreData

class BookmarkViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        cell.textLabel?.text = bookmark[indexPath.row]
               
        return cell
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bookmarkImageView: UIImageView!
    
    
    var bookmark = ["Reproduksi", "Citra Tubuh", "Pubertas", "Anatomi"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookmarkImageView.image = #imageLiteral(resourceName: "Photo 05-04-21 12.13.56")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9803921569, blue: 0.968627451, alpha: 1)
  
    }
    
}

extension BookmarkViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "BookmarkViewController2") as! BookmarkViewController2

        DestVC.getQuizName = bookmark[indexPath.row] as! String
        DestVC.topikIndex = indexPath.row
        self.navigationController?.pushViewController(DestVC, animated: true)

    }
}
