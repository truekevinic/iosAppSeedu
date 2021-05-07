//
//  Boarding2ViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 06/04/21.
//

import UIKit

class Boarding2ViewController: UIViewController {

    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var quizProgress: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var opsi3: UIButton!
    @IBOutlet weak var opsi1: UIButton!
    @IBOutlet weak var opsi2: UIButton!
    @IBOutlet weak var opsi4: UIButton!
    
    var questions = [Question]()
    var questionNumber = 1
    var answers = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        opsi3.isHidden = true
        opsi4.isHidden = true
        questions.append(Question(questionLbl: "Apakah Anda pernah mengajarkan pendidikan seksualitas kepada anak?", options: ["Ya","Tidak"]))
        questions.append(Question(questionLbl: "Materi apa yang Anda rasa kurang Anda kuasai? ", options: ["Reproduksi","Anatomi","Citra Tubuh","Pubertas"]))
        questions.append(Question(questionLbl: "Materi apa yang paling ingin Anda ketahui? ", options: ["Perkembangan janin","Perkembangan fisik","Alat reproduksi","Cara menghargai tubuh"]))
        
    }
    @IBAction func opsi2(_ sender: Any) {
        saveJawaban(opsi: 2)
    }
    @IBAction func opsi1(_ sender: Any) {
        saveJawaban(opsi: 1)
    }
    @IBAction func opsi3(_ sender: Any) {
        saveJawaban(opsi: 3)
    }
    @IBAction func opsi4(_ sender: Any) {
        saveJawaban(opsi: 4)
    }
    func saveJawaban(opsi: Int) -> () {
        answers.append(opsi-1)
        questionNumber = questionNumber+1
   
        if questionNumber > questions.count {
            self.performSegue(withIdentifier: "rekapQuiz", sender: self)
            return
        }
        pageLabel.text = "\(questionNumber)/3"
        quizProgress.progress = quizProgress.progress+0.4
        questionLabel.text = questions[questionNumber-1].questionLbl
        opsi3.isHidden = false
        opsi4.isHidden = false
        
        opsi1.setTitle(questions[questionNumber-1].options[0], for: .normal)
        opsi2.setTitle(questions[questionNumber-1].options[1], for: .normal)
        opsi3.setTitle(questions[questionNumber-1].options[2], for: .normal)
        opsi4.setTitle(questions[questionNumber-1].options[3], for: .normal)
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? RekapViewController{
            destinationVC.answers = answers

        }
    }

}


struct Question {
    var topicId = 0
    var bookmark = true
    var notes = ""
    var questionLbl = ""
    var options = [String]()
}
    
   
