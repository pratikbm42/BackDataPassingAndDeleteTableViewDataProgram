//
//  ViewController.swift
//  deleteTableViewProgram
//
//  Created by Mac on 03/01/34.
//

import UIKit


class ViewController: UIViewController,BackDataPAssingProtocol {
   
    var studentsValue:[Student]=[]                          //Create Stduent Array

    
    @IBOutlet weak var firstVCTableView: UITableView!           //TableView Connection
    
    @IBOutlet weak var noDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.firstVCTableView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")                                                                                   //Register Nib File
        firstVCTableView.delegate=self
        firstVCTableView.dataSource=self
        
  //      if(studentsValue.count<1)
    //        self.noDataLabel.text="No Data Available"
       
    }

    @IBAction func btnInFVC(_ sender: Any) {                                       //Button Connection
        let secondVC=self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        if(studentsValue.count>=0){
        noDataLabel.isHidden=true
        }
        secondVC.delegateSVC=self
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle,forRowAt    indexPath: IndexPath){                                //Function For Swipe And Delete
        if editingStyle == .delete {
            firstVCTableView.beginUpdates()
            studentsValue.remove(at: indexPath.row)
            firstVCTableView.deleteRows(at: [indexPath], with: .left)
            firstVCTableView.endUpdates()
        }
        
    }
    
    func dataPassing(studentValue:Student) {                                //conform Protocol
        let getStudentValue = Student(firstName: studentValue.firstName, middleName: studentValue.middleName, lastName: studentValue.lastName, rollNo: studentValue.rollNo)
        studentsValue.append(getStudentValue)
        self.firstVCTableView.reloadData()
    }
    
       
    
}

extension ViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150                                                  //HeightForRowAt Function
    }
}

extension ViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsValue.count                                  //NumberOfRowsInSection Function
    }
    
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //cellForRowAt Function
        let cell=self.firstVCTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
    //   var data="No Data Available"
       
        let eachStudents=studentsValue[indexPath.row]                   
        cell.firstNameLabel.text=eachStudents.firstName
        cell.middleNameLabel.text=eachStudents.middleName
        cell.thirdNameLabel.text=eachStudents.lastName
        cell.rollNoLabel.text=String(eachStudents.rollNo)
        return cell
    }
}




//No Data Available

