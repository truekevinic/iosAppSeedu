//
//  QuizFinishViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 11/04/21.
//

import UIKit

class QuizFinishViewController: UIViewController {
    @IBOutlet weak var card: UIButton!
    var topicId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    switch topicId {
        case 0:
            card.setTitle("Reproduksi", for: .normal)
        case 1:
            card.setTitle("Citra Tubuh", for: .normal)
        case 2:
            card.setTitle("Pubertas", for: .normal)

        case 3:
            card.setTitle("Anatomi", for: .normal)

        default:
            card.setTitle("button", for: .normal)
        }
    }
    @IBAction func home(_ sender: Any) {
        self.dismiss(animated: true, completion: {});
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func nextQuizButton(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "QuizIntroViewController") as! QuizIntroViewController
        
        
        DestVC.topicId = topicId! + 1
//        present(DestVC, animated: true ,completion: nil)
        self.navigationController?.pushViewController(DestVC, animated: true)
    }
    


}
