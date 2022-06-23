//
//  StudentsTableViewController.swift
//  StudentApp
//
//  Created by Kely Sotsky on 06/04/2022.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    var data = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.studentDataNotification.observe {
            self.reload()
        }
        reload()
    }
    
    func reload(){
        data = Model.instance.getAllStudents()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        let st = data[indexPath.row]
        cell.nameLabel.text = st.name!
        cell.id = st.id!

        return cell
    }
    
    var selectedRow = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Selcted row at \(indexPath.row)")
        selectedRow = indexPath.row
        performSegue(withIdentifier: "openStudentDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openStudentDetails"){
            let dvc = segue.destination as! StudentDetailsViewController
            let st = data[selectedRow]
            dvc.student = st
        }
    }
    

}
