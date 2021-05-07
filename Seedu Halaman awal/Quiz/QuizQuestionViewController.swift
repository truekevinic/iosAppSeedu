//
//  QuizQuestionViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 09/04/21.
//

import UIKit

class QuizQuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var opsiA: UIButton!
    @IBOutlet weak var opsiB: UIButton!
    @IBOutlet weak var opsiC: UIButton!
    @IBOutlet weak var nextAnswer: UIButton!
    var opsi : [UIButton] = []
    
    var answer:Int = 0
    var alreadyselect: Bool = false
    var questionNumber: Int?
    var topicId: Int?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        opsi.append(opsiA)
        opsi.append(opsiB)
        opsi.append(opsiC)
        setup()
        if questionNumber == nil {
            questionNumber = topicId! * 2
        }
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
        self.navigationItem.hidesBackButton = true
        
        nextAnswer.isEnabled = false
        nextAnswer.backgroundColor = .gray
        questionLabel.text = pertanyaan[questionNumber!].question
        pageLabel.text = "Pertanyaan \(questionNumber!%2+1) dari 2"
        
        for i in 0...2 {
           
            opsi[i].setTitle(pertanyaan[questionNumber!].options[i], for: .normal)
        }


    }
    func setup() -> () {
        
        for i in 0...2 {
            opsi[i].layer.borderWidth = 3
            opsi[i].layer.borderColor =  #colorLiteral(red: 0.9931705594, green: 0.5142387152, blue: 0.3547754586, alpha: 1)
            
        }

        
    }
    
    

    @IBAction func opsiA(_ sender: UIButton) {
        deselect()
        opsiA.backgroundColor = #colorLiteral(red: 0.9931705594, green: 0.5142387152, blue: 0.3547754586, alpha: 1)
        answer = 0
        
    }
    @IBAction func opsiB(_ sender: Any) {
        deselect()
        opsiB.backgroundColor = #colorLiteral(red: 0.9931705594, green: 0.5142387152, blue: 0.3547754586, alpha: 1)
        answer = 1
    }
    @IBAction func opsiC(_ sender: Any) {
        deselect()
        opsiC.backgroundColor = #colorLiteral(red: 0.9931705594, green: 0.5142387152, blue: 0.3547754586, alpha: 1)
        answer = 2
    }
    func deselect() -> () {
        
        for i in 0...2 {
            opsi[i].isSelected = false
            opsi[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        nextAnswer.isEnabled = true
        nextAnswer.backgroundColor = #colorLiteral(red: 1, green: 0.7607427239, blue: 0, alpha: 1)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DestVC = segue.destination as? QuizAnswerViewController{
            DestVC.answer = answer
            DestVC.questionNumber = questionNumber
            DestVC.topicId = topicId
        }
    }
    @IBAction func selanjutnya(_ sender: Any) {
        
        
        
    }
}
