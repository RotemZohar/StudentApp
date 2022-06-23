//
//  StudentDetailsViewController.swift
//  StudentApp
//
//  Created by Kely Sotsky on 06/04/2022.
//

import UIKit

class StudentDetailsViewController: UIViewController {

    var student:Student?{
        didSet{
            if(idLabel != nil){
                idLabel.text = student?.id
                nameLabel.text = student?.name
                phoneLabel.text = student?.phone
                addressLabel.text = student?.address
            }
        }
    }
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = student {
            idLabel.text = student.id
            nameLabel.text = student.name
            phoneLabel.text = student.phone
            addressLabel.text = student.address
        }
    }
    
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func onDelete(_ sender: Any) {
        if(student != nil)
        {
            Model.instance.delete(student:student!)
        }
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
