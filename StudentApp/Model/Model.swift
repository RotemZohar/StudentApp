//
//  Model.swift
//  StudentApp
//
//  Created by Eliav Menachi on 11/05/2022.
//

import Foundation
import UIKit
import CoreData

class Model{
    private init(){
       
    }
    static let instance = Model()
    lazy var context:NSManagedObjectContext? = { () -> NSManagedObjectContext? in
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    func getAllStudents()->[Student]{
        guard let context = context else {
            return []
        }

        do{
            let studentsDao = try context.fetch(StudentDao.fetchRequest())
            var stArray:[Student] = []
            for stDao in studentsDao{
                stArray.append(Student(student:stDao))
            }
            return stArray
        }catch let error as NSError{
            print("student fetch error \(error) \(error.userInfo)")
            return []
        }
    }
    
    func add(student:Student){
        guard let context = context else {
            return
        }
        
        let st = StudentDao(context: context)
        st.id = student.id
        st.name = student.name
        st.phone = student.phone
        st.avatarUrl = student.avatarUrl
        
        do{
            try context.save()
        }catch let error as NSError{
            print("student add error \(error) \(error.userInfo)")
        }
    }
    
    func getStudent(byId:String)->Student?{
        return nil
    }
    
    func delete(student:Student){
        
    }
}
