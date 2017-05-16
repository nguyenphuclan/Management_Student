//
//  Detail.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/16/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import Foundation

// Class thông tin chi tiết mỗi học sinh
class Detail {
    var students: [Student] = {
        return Student.firstStudents()
    }()
}
