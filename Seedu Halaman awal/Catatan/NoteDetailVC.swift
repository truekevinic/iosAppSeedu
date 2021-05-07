//
//  NoteDetailVC.swift
//  Seedu Halaman awal
//
//  Created by jona on 14/04/21.
//

import UIKit
import CoreData


class NoteDetailVC: UIViewController
{
//    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descTV: UITextView!
//    @IBOutlet weak var kategoriLabel: UITextField!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var kategoriPicker = UIPickerView()
    
    var selectedNote: Bookmark?
    let kategori = ["Reproduksi", "Anatomi", "Citra Tubuh", "Pubertas"]

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(selectedNote?.desc != nil && selectedNote?.desc != "" )
        {
//            titleTF.text = selectedNote?.title
            descTV.text = selectedNote?.desc
//            kategoriLabel.text = selectedNote?.kategori
        }
        
        descTV.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
        descTV.layer.borderWidth = 1
//        titleTF.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
//        titleTF.layer.borderWidth = 1
//        kategoriLabel.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
//        kategoriLabel.layer.borderWidth = 1
        
//        kategoriLabel.inputView = kategoriPicker
//        kategoriPicker.delegate = self
//        kategoriPicker.dataSource = self
        
    }


    @IBAction func saveAction(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        var id = selectedNote!.bookmarkid as! Int
       
        do{
            
        
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
            let results = try context.fetch(request)
            let newNote = results[id] as! NSManagedObject

            newNote.setValue(descTV.text, forKey: "Desc")
            
            do
            {
                try context.save()
                
                navigationController?.popViewController(animated: true)
            }
            catch
            {
                print("context save error")
            }
        }catch
        {
            print("context save error")
        }

        
    }
    
    
    @IBAction func DeleteNote(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        var id = selectedNote!.bookmarkid as! Int
        do {
            let results = try context.fetch(request)
            let objectUpdate = results[id] as! NSManagedObject
            objectUpdate.setValue("", forKey: "Desc")
            try context.save()
                    navigationController?.popViewController(animated: true)
                
            
        }
        catch
        {
            print("Fetch Failed")
        }
    }
    
}

//extension NoteDetailVC: UIPickerViewDelegate, UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return kategori.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        kategoriLabel.text = kategori[row]
//        kategoriLabel.resignFirstResponder()
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return kategori[row]
//    }
//
//}

