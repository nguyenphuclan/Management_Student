//
//  StudentDetailViewController.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    var student: Student?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var yearOldLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = student?.name
        universityLabel.text = student?.university
        descriptionLabel.text = student?.description
        yearOldLabel.text! = String(student!.yearOld)
    }
}
