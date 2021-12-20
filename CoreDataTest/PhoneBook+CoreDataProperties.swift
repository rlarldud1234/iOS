//
//  PhoneBook+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by 김기영 on 2021/12/20.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var memo: String?
    @NSManaged public var personName: String?
    @NSManaged public var phoneNumber: String?

}

extension PhoneBook : Identifiable {

}
