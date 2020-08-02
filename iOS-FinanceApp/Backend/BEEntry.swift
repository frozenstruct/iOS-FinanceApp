//
//  Entry.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 02.07.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation
import RealmSwift

class Entry: Object {
    
    // MARK: - Entry Properties
    
    @objc dynamic var id: String?
    
    @objc dynamic var name: String?
    @objc dynamic var amount: Int = 0
    @objc dynamic var date: Date?
    @objc dynamic var category: String?
    @objc dynamic var entryType: String?
    
    @objc dynamic var strDate: String?
    @objc dynamic var creationStamp: String?
    @objc dynamic var weekDay: Int = 0
    @objc dynamic var weekOfMonth: Int = 0
    @objc dynamic var quarter: Int = 0
    @objc dynamic var hour: Int = 0
    
    
    // MARK: - Custom Init to Add an Entry
    /**
     convenience init - secondary supporting initializer [SOMEHOW NOW THIS IS THE ONLY WAY TO INIT REALM INSTANCE ~> NEEDS CLARIFICATION]
     */
    convenience init(id: String,
                     name: String,
                     amount: Int,
                     date: Date,
                     category: String,
                     entryType: String?,
                     ToC: String,
                     weekDay: Int,
                     weekOfMonth: Int,
                     quarter: Int,
                     time: Int)
    {
        self.init()
        
        self.id = id
        
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
        self.entryType = entryType
        
        self.strDate = Helpers.createDateFormatter(
            dateStyle: .medium,
            timeStyle: .none
        ).string(from: date)
        
        self.creationStamp = ToC
        self.weekDay = weekDay
        self.weekOfMonth = weekOfMonth
        self.quarter = quarter
        self.hour = time
    }
    
    // MARK: - Entry Description
    override var description: String {
        get {
            return """
            \n\t- Entry description:
            \t\t- id: \(id ?? "");
            \t\t- name: \(name ?? "");
            \t\t- amount: \(amount);
            \t\t- date: \(date ?? Date());
            \t\t- type: \(entryType ?? "");
            \t\t- category: \(category ?? "");
            \t\t- ToC: \(creationStamp ?? "");
            \t\t- weekday: \(weekDay);
            \t\t- week of month: \(weekOfMonth);
            \t\t- quarter: \(quarter).
            \t [END OF ENTRY DESCRIPTION]\n
            """
        }
    }
}
