//
//  InStudent.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import Foundation

class InStudent {
    
    var nameOfStudent: String
    var students: [Student]
    
    // Khởi tạo
    init(nameOfStudent: String, infStudent: [Student]) {
        self.nameOfStudent = nameOfStudent
        self.students = infStudent
    }
    
    // Tạo dữ liệu các sinh viên ban đầu
    class func inStudent() -> [InStudent] {
        return [self.st1(), self.st2(), self.st3(), self.st4()]
    }
    
    private class func st1() -> InStudent {
        var students = [Student]()
        
        students.append(Student(name: "Nguyễn Phúc Lân", university: "Đại học Sư phạm Kỹ Thuật", description: "🦁", yearOld: 22))
        
        return InStudent(nameOfStudent: students[1].name, infStudent: students)
    }
    
    private class func st2() -> InStudent {
        var students = [Student]()
        
        students.append(Student(name: "Hà Hải Duy", university: "Đại học Sư phạm Kỹ Thuật", description: "🦊", yearOld: 22))
        
        return InStudent(nameOfStudent: students[2].name, infStudent: students)
    }
    
    private class func st3() -> InStudent {
        var students = [Student]()
        
        students.append(Student(name: "Đinh Vũ Hoàng", university: "Đại học Sư phạm Kỹ Thuật", description: "🐷", yearOld: 22))
        
        return InStudent(nameOfStudent: students[3].name, infStudent: students)
    }
    
    private class func st4() -> InStudent {
        var students = [Student]()
        
        students.append(Student(name: "Phạm Hữu Như", university: "Đại học Sư phạm Kỹ Thuật", description: "🐔", yearOld: 22))
        
        return InStudent(nameOfStudent: students[4].name, infStudent: students)
    }
}
