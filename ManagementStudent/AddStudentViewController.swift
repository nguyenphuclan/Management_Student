//
//  AddStudentViewController.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    
    var detail: Detail?
    
    func getDetail(detail: Detail) {
        self.detail = detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Hiển thị bàn phím số khi muốn nhập Year Old
        yearOldTextField.keyboardType = UIKeyboardType.decimalPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Xử lí khi nhấn vào nút Save
    @IBAction func saveAction(_ sender: Any) {
        
        // Nếu điền đầy đủ thông tin
        if nameTextField.text! != "" && universityTextField.text! != "" && descriptionTextField.text! != "" && yearOldTextField.text! != "" {
            //Thêm sinh viên
            detail?.students.append(Student(name: nameTextField.text!, university: universityTextField.text!, description: descriptionTextField.text!, yearOld: Int(yearOldTextField.text!)!))
            // Thông báo
            let alert = UIAlertController(title: "Thông báo", message: "Đã lưu", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
            // Xoá text
            nameTextField.text = ""
            universityTextField.text = ""
            descriptionTextField.text = ""
            yearOldTextField.text = ""
        }
        else {
            let alert = UIAlertController(title: "Thông báo", message: "Vui lòng không để trống", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

    //Dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        universityTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        yearOldTextField.resignFirstResponder()
        return true;
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        universityTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        yearOldTextField.resignFirstResponder()
    }
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }
}
