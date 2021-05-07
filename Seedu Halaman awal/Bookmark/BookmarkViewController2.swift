//
//  BookmarkViewController2.swift
//  Seedu Halaman awal
//
//  Created by jona on 13/04/21.
//

import UIKit
import CoreData

class BookmarkViewController2: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var getQuizName = String()
    var topikIndex: Int?
    var questions = [Bookmark]()
    var bookmarkeds = [Int]()
    @IBOutlet weak var tableView: UITableView!
    
    var bookmark = ["Reproduksi", "Citra Tubuh", "Pubertas", "Anatomi"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(getQuizName)
        
        questions.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        do {
            let results = try context.fetch(request)
            for data in results as! [NSManagedObject]
            {
                let question = data as! Bookmark
                questions.append(question)
                
            }
        }
        catch
        {
            print("Fetch Failed")
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = getQuizName
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9803921569, blue: 0.968627451, alpha: 1)

    }
}

extension BookmarkViewController2: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "NoteTableView") as! NoteTableView
    
    
        DestVC.topikID = questions[bookmarkeds[indexPath.row]].bookmarkid as! Int
        
        self.navigationController?.pushViewController(DestVC, animated: true)
    }
}

extension BookmarkViewController2: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countBookmarked()
    }
    
    func countBookmarked() -> Int {
        var counter = 0
        var starting = topikIndex! * 2
        for i in 0...1 {
            if questions[starting + i].bookmarked == 1 {
                bookmarkeds.append(starting + i)
                counter = counter + 1
            }
        }
        
        return counter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        cell.textLabel?.text = questions[bookmarkeds[indexPath.row]].title
        return cell
    }
    
    
}
