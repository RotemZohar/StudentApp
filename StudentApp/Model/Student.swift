//
//  Student.swift
//  StudentApp
//
//  Created by Eliav Menachi on 11/05/2022.
//

import Foundation

class Student{
    public var id: String?
    public var name: String?
    public var phone: String?
    public var avatarUrl: String?
    
    init(){}
    
    init(student:StudentDao){
        id = student.id
        name = student.name
        phone = student.phone
        avatarUrl = student.avatarUrl
        
    }
    
}
