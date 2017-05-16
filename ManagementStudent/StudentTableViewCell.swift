//
//  StudentTableViewCell.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentUniversityLabel: UILabel!
    @IBOutlet weak var studentDescriptionLabel: UILabel!
    @IBOutlet weak var studentYearOldLabel: UILabel!
    
    // Cấu hình cho mỗi cell
    func configureCellWith(student: Student) {
        studentNameLabel.text = student.name
        studentUniversityLabel.text = student.university
        studentDescriptionLabel.text = student.description
        studentYearOldLabel.text = String(student.yearOld)
    }
}
