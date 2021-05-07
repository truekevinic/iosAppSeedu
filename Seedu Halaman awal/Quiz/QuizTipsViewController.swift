//
//  QuizTipsViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 11/04/21.
//

import UIKit

class QuizTipsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    var topicId: Int?
    var questionNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = pertanyaan[questionNumber!].question
        explanationLabel.text = pertanyaan[questionNumber!].tips
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
