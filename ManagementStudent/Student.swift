//
//  Student.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import Foundation

// Lớp chứa các biến thông tin của 1 sinh viên
class Student
{
    var name: String
    var university: String
    var description: String
    var yearOld: Int
    
    // Khởi tạo
    init(name: String, university: String, description: String, yearOld: Int) {
        self.name = name
        self.university = university
        self.description = description
        self.yearOld = yearOld
    }
    
    // Tạo dữ liệu các sinh viên ban đầu
    class func firstStudents() -> [Student]{

        var students = [Student]()
            
        students.append(Student(name: "Nguyễn Phúc Lân", university: "Đại học Sư phạm Kỹ Thuật", description: "🦁", yearOld: 22))
        students.append(Student(name: "Hà Hải Duy", university: "Đại học Sư phạm Kỹ Thuật", description: "🦊", yearOld: 22))
        students.append(Student(name: "Đinh Vũ Hoàng", university: "Đại học Sư phạm Kỹ Thuật", description: "🐷", yearOld: 22))
        students.append(Student(name: "Phạm Hữu Như", university: "Đại học Sư phạm Kỹ Thuật", description: "🐔", yearOld: 22))
            
        return students
    }
}
