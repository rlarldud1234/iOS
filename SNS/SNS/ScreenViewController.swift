//
//  ScreenViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/09.
//

import UIKit



class ScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    @IBOutlet weak var tableView : UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        cell.detailTextLabel?.text = data[indexPath.row].deatail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.setCellData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    func setCellData() {
        let cell = data.map {
            [
                "title" : $0.title,
                "detail" : $0.deatail
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(cell, forKey: "cellItem")
        userDefaults.synchronize()
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        guard let cellData = userDefaults.object(forKey: "cellItem") as? [[String : AnyObject]] else {
            return
        }
        
        data = cellData.map {
            let title = $0["title"] as? String
            let detail = $0["detail"] as? String
            
            return DataList(title: title!, deatail: detail!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        setCellData()
        tableView.reloadData()
    }
    
    @IBAction func tableView(_ sender : UIBarButtonItem){
        if tableView.isEditing{
            tableView.setEditing(false, animated: true)
        }
        else {
            tableView.setEditing(true,
                                 animated: true)
        }
        
    }
    @IBAction func backBtn(_sender : UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "a") as? ExpansionViewController else {
            return
        }
        detailVC.titleItem = data[indexPath.row].title
        detailVC.detailItem = data[indexPath.row].deatail
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

