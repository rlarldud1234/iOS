//
//  ViewController.swift
//  ToDoList
//
//  Created by 김기영 on 2021/05/09.
//

import UIKit

var list = [toDoList]()

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }//리스트의 값 만큼 행이 만들어짐

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].content
        
        return cell
    }//셀에다가 주제와 내용 넣어주고 반환해주기
    func setData(){
        let Data = list.map {
            [
                "title" : $0.title,
                "content" : $0.content
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(Data, forKey: "item")
        userDefaults.synchronize()
    }
    
    func loadAllData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
            return
        }
            print(data.description)
     
            // list 배열에 저장하기
            print(type(of: data))
            list = data.map {
                let title = $0["title"] as? String
                let content = $0["content"] as? String
                
                return toDoList(title: title!, content: content!)
            }
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let alert = UIAlertController(title: "Hey", message: "really Delete", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive){
                (action) in list.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }//리스트값과 테이블뷰의 행이랑 같이 삭제해주는 거
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource  = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        loadAllData()
    }//위에서 창조한 걸 지가 했다고 말하는거
    
    override func viewDidAppear(_ animated: Bool) {
        setData()
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
        
    }//에디팅 모드 활성화되어 있으면 비활성화로 비활성화로 되어있으면 활성화


//    출처: https://hyesunzzang.tistory.com/68?category=626591 [dev.ssun]
}
