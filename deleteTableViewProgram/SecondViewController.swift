//
//  SecondViewController.swift
//  deleteTableViewProgram
//
//  Created by Mac on 03/01/34.
//

import UIKit

class SecondViewController: UIViewController {

    var delegateSVC:BackDataPAssingProtocol?                            //Create Delegate Property
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var rollNoTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func showAlert(){                                               //Function For Notification
        let alert=UIAlertController(title: title, message:"TextField Should Not Empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    @IBAction func buttonInSVC(_ sender: Any) {                         //Back button
        guard let delegate = delegateSVC else {
            return
        }
        if(firstNameTextField.text=="" || middleNameTextField.text=="" || lastNameTextField.text=="" || rollNoTextField.text=="")
        {
            showAlert()
        }
        else {
            let textRetrivedFromFirstNameTextField=self.firstNameTextField.text
            let textRetrivedFromMiddleNameTextField=self.middleNameTextField.text
            let textRetrivedFromLastNameTextField=self.lastNameTextField.text
            let textRetrivedFromRollNoTextField=Int(self.rollNoTextField.text!)
            
            let studentDataToBePassed=Student(firstName: textRetrivedFromFirstNameTextField!, middleName: textRetrivedFromMiddleNameTextField!, lastName: textRetrivedFromLastNameTextField!, rollNo: textRetrivedFromRollNoTextField!)
            
            delegate.dataPassing(studentValue: studentDataToBePassed)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
