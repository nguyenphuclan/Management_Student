//
//  ManagementStudentTableViewController.swift
//  ManagementStudent
//
//  Created by Lan Nguyen on 5/15/17.
//  Copyright © 2017 Lan Nguyen. All rights reserved.
//

import UIKit

class ManagementStudentTableViewController: UITableViewController {

    // Khai báo mảng các class Student để lưu kết quả đã được lọc
    var filteredStudent = [Student]()
    // Khai báo biến chứa dữ liệu sinh viên
    var detail = Detail()
    
    // Khai báo search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Thiết lập search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        // Search bar nằm ở phần Header View của Table
        tableView.tableHeaderView = searchController.searchBar
        
        // Tạo nút edit bên phải
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    // Load lại dữ liệu khi quay lại view này
    override func viewWillAppear(_ animated: Bool) {
            tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    // Mặc định 1 section
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Trả về số dòng của table, TH1: chưa search, TH2: Đã search
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudent.count
        }
        return detail.students.count
    }

    // Thiết lập nội dung cell của TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
        let student: Student
        // 2 TH: search và không search
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudent[indexPath.row]
        } else {
            student = detail.students[indexPath.row]
        }
        cell.configureCellWith(student: student)

        return cell
    }
    
    // Chuẩn bị trước khi chuyển sang view mới
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Nếu nhấn vào 1 student thì sẽ hiện ra view Student Detail
        if (segue.identifier == "ShowDetail") {
            let studentDetail = segue.destination as! StudentDetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let student: Student
                if searchController.isActive && searchController.searchBar.text != "" {
                    student = filteredStudent[indexPath.row]
                } else {
                    student = detail.students[indexPath.row]
                }
                
                studentDetail.student = student
            }
        }
        // Nếu nhấn vào nút Add thì sẽ hiện ra view Add Student
        else if (segue.identifier == "AddStudent")
        {
            // Lấy cơ sở dữ liệu ra để chuẩn bị thêm vào
            let addStudent = segue.destination as! AddStudentViewController
            addStudent.getDetail(detail: detail)
        }
    }
    
    // Lọc nội dung theo chuỗi đã nhập
    func filterContentForSearchText(_ searchText: String) {
        
        filteredStudent = detail.students.filter({(student : Student) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // Xoá dữ liệu
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            detail.students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Sắp xếp dữ liệu
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // lầy dữ liệu
        let sourceStudent = detail.students[sourceIndexPath.row]
        // xoá dữ liệu
        detail.students.remove(at: sourceIndexPath.row)
        // chèn dữ liệu vào
        detail.students.insert(sourceStudent, at: destinationIndexPath.row)
    }
}

extension ManagementStudentTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension ManagementStudentTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}
