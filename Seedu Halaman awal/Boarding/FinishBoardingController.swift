//
//  FinishBoardingController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 07/04/21.
//

import UIKit

class FinishBoardingController: UIViewController {
    var answers: [Int] = []
    
    @IBOutlet weak var rekomendasiLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        var rekomendasi = ""
        switch answers[2] {
        case 0:
            rekomendasi = "Reproduksi"
            answers.append(0)
        case 1:
            rekomendasi = "Anatomi"
            answers.append(1)
        case 2:
            rekomendasi = "Pubertas"
            answers.append(2)
        case 3:
            rekomendasi = "Citra Tubuh"
            answers.append(3)
        default:
            print("error")
        }
        
        rekomendasiLabel.setTitle(rekomendasi, for: .normal)
        UserDefaults.standard.setValue(false, forKey: "onBoarding")
        print(UserDefaults.standard.bool(forKey: "onBoarding"))
        // Do any additional setup after loading the view.
    }
    @IBAction func home(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = false
        self.dismiss(animated: true, completion: {});
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func goToQuiz(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.navigationController?.isNavigationBarHidden = false
        let DestVC = Storyboard.instantiateViewController(withIdentifier: "QuizIntroViewController") as! QuizIntroViewController
        
            DestVC.topicId = answers[3]
        
        self.navigationController?.pushViewController(DestVC, animated: true)
//            present(DestVC, animated: false, completion: nil)
    }
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC = segue.destination as? RekapViewController{
//            destinationVC.quiz = answers[3]
//
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
