import UIKit

struct toDoList {
    var title : String = ""
    var content : String = ""
}

class TextViewController: UIViewController {
    
    @IBOutlet weak var textTitle : UITextField!
    @IBOutlet weak var enterText : UITextView!
    
    
    
    func item() {
        do { let item: toDoList = toDoList(title : textTitle.text!, content : enterText.text!)
            list.append(item)
            self.navigationController?.popViewController(animated: true);}}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneBtn(_ sneder : Any){
        
        let alret = UIAlertController(title: "Hey", message: "really save?", preferredStyle: UIAlertController.Style.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .destructive) {
            (action) in self.item()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alret.addAction(cancelAction)
        alret.addAction(defaultAction)
        present(alret, animated: true, completion: nil)
        //아이템에 입력한 값을 넣고 아이템의 있는 값을 공유해주고 팝해줌
    }
    
}
// let data = UserDefaults.standard.value(forKey: "item")
