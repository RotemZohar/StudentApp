//
//  NewStudentViewController.swift
//  StudentApp
//
//  Created by Eliav Menachi on 11/05/2022.
//

import UIKit

class NewStudentViewController: UIViewController {


    @IBOutlet weak var addressTv: UITextField!
    @IBOutlet weak var phoneTv: UITextField!
    @IBOutlet weak var nameTv: UITextField!
    @IBOutlet weak var idTv: UITextField!
    @IBOutlet weak var avatarImgv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cacnel(_ sender: Any) {
        if(self.navigationController != nil)
        {self.navigationController?.popViewController(animated: true)}
    }
    
    @IBAction func save(_ sender: Any) {
        let student = Student()
        student.id = idTv.text
        student.name = nameTv.text
        student.address = addressTv.text
        student.phone = phoneTv.text
        
        Model.instance.add(student: student)
        if(self.navigationController != nil)
        {self.navigationController?.popViewController(animated: true)}
        
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
