//
//  QuizIntroViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 10/04/21.
//
import UIKit
class QuizIntroViewController: UIViewController{
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var banner: UIImageView!
    
        var topicId : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        switch topicId {
        case 0:
            self.navigationItem.title = "Reproduksi"
            banner.image = #imageLiteral(resourceName: "Reproduksi")
        case 1:
            self.navigationItem.title = "Citra Tubuh"
            banner.image = #imageLiteral(resourceName: "Body Image")
        case 2:
            self.navigationItem.title = "Pubertas"
            banner.image = #imageLiteral(resourceName: "pubertas")
        case 3:
            self.navigationItem.title = "Anatomi"
            banner.image = #imageLiteral(resourceName: "Anatomy")
        default:
            self.navigationItem.title = "title"
        }
        
        self.navigationItem.hidesBackButton = true
        
        
    }
    
    @IBAction func Homee(_ sender: Any) {
        self.dismiss(animated: true, completion: {});
        self.navigationController?.popViewController(animated: true);
    }
    @IBAction func lanjutQuiz(_ sender: Any) {
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DestVC = segue.destination as? QuizQuestionViewController{
            DestVC.topicId = topicId

        }else{
            if let DestVC = segue.destination as? MenuUtamaViewController {
                
            }
        }
    }
    @IBAction func backHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}

extension QuizIntroViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  pertanyaan[indexPath.row + (topicId! * 2)].question
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.textColor = .black
        
        
        
        return cell
    }
}
