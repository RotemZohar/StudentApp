//
//  Model.swift
//  StudentApp
//
//  Created by Eliav Menachi on 11/05/2022.
//

import Foundation
import UIKit
import CoreData

class ModelNotificatiponBase{
    let name:String
    init(_ name:String){
        self.name=name
    }
    func observe(callback:@escaping ()->Void){
        NotificationCenter.default.addObserver(forName: Notification.Name(name), object: nil, queue: nil){ data in
            NSLog("got notify")
            callback()
        }
    }
    
    func post(){
        NSLog("post notify")
        NotificationCenter.default.post(name: Notification.Name(name), object: self)
    }

}

class Model{
    private init(){
       
    }
    
    // Notification center
    static let studentDataNotification = ModelNotificatiponBase("com.menachi.studentDataNotification")
    
    
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
        st.address = student.address
        
        do{
            try context.save()
        }catch let error as NSError{
            print("student add error \(error) \(error.userInfo)")
        }
        Model.studentDataNotification.post()
    }
    
    func getStudent(byId:String)->Student?{
        return nil
    }
    
    func delete(student:Student){
        guard let context = context else {
            return
        }
        
        let fetchReq = StudentDao.fetchRequest()

        do{
            let studentsDao = try context.fetch(fetchReq)
            for stDao in studentsDao{
                if(student.id == stDao.id)
                {
                    context.delete(stDao)
                    
                }
            }
            
        }catch let error as NSError{
            print("student fetch error \(error) \(error.userInfo)")

        }
        
        do{
            try context.save()
        } catch {
            print("Error in saving delete")
        }
        Model.studentDataNotification.post()
        
    }
    
    func update(student:Student){
        guard let context = context else {
            return
        }
        
        let fetchReq = StudentDao.fetchRequest()
        fetchReq.predicate = NSPredicate.init(format: "id == \(student.id)")

        do{
            let studentsDao = try context.fetch(fetchReq)
            for stDao in studentsDao{
//                context.updatedObjects({})
            }
            
        }catch let error as NSError{
            print("student fetch error \(error) \(error.userInfo)")

        }
        
        do{
            try context.save()
        } catch {
            print("Error in saving delete")
        }
        
    }
}
