//
//  QuizAnswerViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 09/04/21.
//

import UIKit
import CoreData

class QuizAnswerViewController: UIViewController {
    var questionNumber: Int?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIBarButtonItem!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var explanationLable: UILabel!
    var answer: Int?
    var topicId: Int?
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if answer! == pertanyaan[questionNumber!].correctAns {
            answersLabel.text = "Betul!"
        }else{
            answersLabel.text = "Kurang Tepat"
        }
        if getFromDb() {
            bookmarkButton.image = UIImage(systemName: "bookmark.fill")
            
            
        }else{
            bookmarkButton.image = UIImage(systemName: "bookmark")
        }
        explanationLable.text = pertanyaan[questionNumber!].penjelasan[answer!]
        image.image = UIImage(named:pertanyaan[questionNumber!].image)
        pageLabel.text = "Pertanyaan \(questionNumber!%2 + 1) dari 2"
        self.navigationItem.hidesBackButton = true
        
        switch topicId {
        case 0:
            self.navigationItem.title = "Reproduksi"
        case 1:
            self.navigationItem.title = "Citra Tubuh"
        case 2:
            self.navigationItem.title = "Pubertas"
        case 3:
            self.navigationItem.title = "Anatomi"
        default:
            self.navigationItem.title = "title"
        }
       
    }
    
    func getFromDb() -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        
        do{
            let results = try context.fetch(request)
        let result = results[questionNumber!] as! NSManagedObject
            if (result.value(forKey: "bookmarked") as! Int == 1) {
                return true
            }else{
                return false
            }
        }catch{
        }
        return false
    }
    
    
    @IBAction func bookmarkButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        do{
            let results = try context.fetch(request)
            let objectUpdate = results[questionNumber!] as! NSManagedObject
            
        
        if getFromDb() {
            pertanyaan[questionNumber!].bookmark = false
            bookmarkButton.image = UIImage(systemName: "bookmark")
            objectUpdate.setValue(0, forKey: "bookmarked")
            
        }else{
            pertanyaan[questionNumber!].bookmark = true
            bookmarkButton.image = UIImage(systemName: "bookmark.fill")
            objectUpdate.setValue(1, forKey: "bookmarked")
            
        }
        do {
            try context.save()
            print("Data Saved Successfully")
        } catch {
            print("Data Saved Unsucesfully")
        }
        }catch{
        }
        
    }
    @IBAction func tipsButton(_ sender: Any) {
        
            
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DestVC = segue.destination as? QuizTipsViewController{
            DestVC.questionNumber = questionNumber!
            DestVC.topicId = topicId
        }
    }
    @IBAction func selanjutnya(_ sender: Any) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        if questionNumber!%2 >= 1 {
            
            let DestVC = Storyboard.instantiateViewController(withIdentifier: "QuizFinishViewController") as! QuizFinishViewController
                
            DestVC.topicId = topicId
//            present(DestVC, animated: true ,completion: nil)
            self.navigationController?.pushViewController(DestVC, animated: true)

        }else{
            questionNumber = questionNumber! + 1
            let DestVC = Storyboard.instantiateViewController(withIdentifier: "QuizQuestionViewController") as! QuizQuestionViewController
            DestVC.questionNumber = questionNumber!
            DestVC.topicId = topicId

//            present(DestVC, animated: false ,completion: nil)
            self.navigationController?.pushViewController(DestVC, animated: true)
        }
       
        
    }
    
    

}
