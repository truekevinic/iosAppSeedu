//
//  NoteTableView.swift
//  Seedu Halaman awal
//
//  Created by jona on 14/04/21.
//
import UIKit
import CoreData

var noteList = [Bookmark]()


class NoteTableView: UIViewController
{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var firstLoad = true
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIBarButtonItem!
    var topikID: Int?
    var catatan: Int?
    func nonDeletedNotes() -> [Bookmark]
    {
        var noDeleteNoteList = [Bookmark]()
        for note in noteList
        {
            if(note.deletedDate == nil)
            {
                noDeleteNoteList.append(note)
            }
        }
        return noDeleteNoteList
    }
    
    override func viewDidLoad()
    {
        if getFromDb() {
            bookmarkButton.image = UIImage(systemName: "bookmark.fill")
            
            
        }else{
            bookmarkButton.image = UIImage(systemName: "bookmark")
        }
        noteList.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        
        do {
            let results = try context.fetch(request)
            let question = results[topikID!] as! Bookmark
            noteList.append(question)
            }
        
        catch{
            print("Fetch Failed")
        }
        
        questionLabel.text = noteList[0].title
        image.image = UIImage(named:noteList[0].image)
        answerLabel.text = noteList[0].penjelasan
        
//        if(firstLoad)
//        {
//            firstLoad = false
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
//            do {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results
//                {
//                    let note = result as! Bookmark
//                    noteList.append(note)
//                }
//            }
//            catch
//            {
//                print("Fetch Failed")
//            }
//        }
    }
    
    func getFromDb() -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        
        do{
            let results = try context.fetch(request)
        let result = results[topikID!] as! NSManagedObject
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
            let objectUpdate = results[topikID!] as! NSManagedObject
            
        
        if getFromDb() {
            pertanyaan[topikID!].bookmark = false
            bookmarkButton.image = UIImage(systemName: "bookmark")
            objectUpdate.setValue(0, forKey: "bookmarked")
            
        }else{
            pertanyaan[topikID!].bookmark = true
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
            DestVC.questionNumber = topikID!
        }
    }
    
    @IBAction func editnote(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "NoteDetailVC") as! NoteDetailVC
//        if noteList[0].desc != nil || noteList[0].desc == ""{
            var selectedNote = noteList[0]
            DestVC.selectedNote = selectedNote
//        }else{
//            DestVC.selectedNote = nil
//        }
            

        self.navigationController?.pushViewController(DestVC, animated: true)
    }
}
