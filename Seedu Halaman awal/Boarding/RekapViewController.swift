//
//  RekapViewController.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 07/04/21.
//

import UIKit

class RekapViewController: UIViewController {

    var answers:[Int] = []
    
    @IBOutlet weak var pengalamanMengajar: UITextField!
    @IBOutlet weak var kurangDikuasai: UITextField!
    @IBOutlet weak var inginDipelajari: UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editButton2: UIButton!
    @IBOutlet weak var editButton3: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var kurangPickerView: UIPickerView!
    @IBOutlet weak var inginPickerView: UIPickerView!
    @IBOutlet weak var buttonLanjut: UIButton!
    
    let pengalaman = ["Ya", "Tidak"]
    let materiTidak = ["Anatomi", "Citra Tubuh", "Pubertas", "Reproduksi"]
    let materiIngin = ["Perkembangan Janin ", "Perkembangan Fisik", "Alat Reproduksi", "Cara Menghargai Tubuh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.isHidden = true
        kurangPickerView.isHidden = true
        inginPickerView.isHidden = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
        kurangPickerView.delegate = self
        kurangPickerView.dataSource = self
        inginPickerView.delegate = self
        inginPickerView.delegate = self
        
        pengalamanMengajar.inputView = pickerView
        kurangDikuasai.inputView = kurangPickerView
        inginDipelajari.inputView = inginDipelajari
        
        pengalamanMengajar.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
        pengalamanMengajar.layer.borderWidth = 1
        kurangDikuasai.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
        kurangDikuasai.layer.borderWidth = 1
        inginDipelajari.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.4549019608, blue: 0.3215686275, alpha: 1)
        inginDipelajari.layer.borderWidth = 1
        
        pengalamanMengajar.text = pengalaman[answers[0]]
        kurangDikuasai.text = materiTidak[answers[1]]
        inginDipelajari.text = materiIngin[answers[2]]
        
        
        pickerView.tag = 1
        kurangPickerView.tag = 2
        inginPickerView.tag = 3
        
    }
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        
        if pickerView.isHidden{
            pickerView.isHidden = false
        }
    }
    
    @IBAction func buttonSelect2(_ sender: UIButton) {
        
        if kurangPickerView.isHidden{
            kurangPickerView.isHidden = false
        }
    }
    
    @IBAction func buttonSelect3(_ sender: UIButton) {
        
        if inginPickerView.isHidden{
            inginPickerView.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FinishBoardingController{
            destinationVC.answers = answers

        }
    }
    
}

extension RekapViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return pengalaman.count
        case 2:
            return materiTidak.count
        case 3:
            return materiIngin.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            pengalamanMengajar.text = pengalaman[row]
            answers[0]=row
            print(answers[0])
            pengalamanMengajar.resignFirstResponder()
            pickerView.isHidden = true
        case 2:
            kurangDikuasai.text = materiTidak[row]
            answers[1]=row
            kurangDikuasai.resignFirstResponder()
            kurangPickerView.isHidden = true
        case 3:
            inginDipelajari.text = materiIngin[row]
            answers[2]=row
            inginDipelajari.resignFirstResponder()
            inginPickerView.isHidden = true
        default:
            return
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return pengalaman[row]
        case 2:
            return materiTidak[row]
        case 3:
            return materiIngin[row]
        default:
            return "No data"
        }
    }
    
}
