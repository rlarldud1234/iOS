//
//  ViewController.swift
//  CoreDataTest
//
//  Created by 김기영 on 2021/12/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        let entity = NSEntityDescription.entity(forEntityName: "PhoneBook", in: self.container.viewContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        person.setValue("저장이 잘 될까요", forKey: "memo")
        person.setValue("김기영", forKey: "personName")
        person.setValue("010-6482-3852", forKey: "phoneNumber")
        
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        fetchContact()
    }
    
    func fetchContact() {
        do {
            let contact = try self.container.viewContext.fetch(PhoneBook.fetchRequest()) as! [PhoneBook]
            
            contact.forEach{
                print($0.personName)
                print($0.phoneNumber)
                print($0.memo)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

