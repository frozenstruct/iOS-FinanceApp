//
//  Graph Data Source.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 02.07.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation
import RealmSwift

class GraphDataSource {
    var matchedEntries = [Entry]()
    var income = [Int]()
    var expenses = [Int]()
    
    
    func getTimeframeData(timeFrame: TimeFrame, input data: Results<Entry> = entries, cutOff: Date) {
        data.forEach {
            $0.date! >= cutOff ? matchedEntries.append($0) : nil
        }
        
        matchedEntries.forEach {
            $0.amount > 0 ? income.append($0.amount) : expenses.append($0.amount * -1)
        }
        
        let labelIncomeData = [income.max(), income.median(), income.min()]
        let labelExpenseData = [expenses.max(), expenses.median(), expenses.min()]
        
        Publisher.send(GRTransmission(
            income: income,
            expenses: expenses,
            labelsIncomeData: labelIncomeData,
            labelsExpenseData: labelExpenseData,
            incomeTotal: income.reduce(0, +),
            expensesTotal: expenses.reduce(0, +)))
    }
    
    func getDailyAmounts() {
        var fourAM, eightAM, midday, fourPM, eightPM, midnight: [Int]
    }
    
    func getWeelyAmounts() {
        var sun, mon, tue, wed, thu, fri, sat: [Int]
    }
    
    func getMonthlyAmounts() {
        var week1, week2, week3, week: [Int]
    }
    
    func getYearlyAmounts() {
        var q1, q2, q3, q4: [Int]
    }
}

struct Expenses {
    static var amountSet = [Int]()
    
    static var max: Int {
        get { return amountSet.max() ?? 0 }
    }
    static var med: Int {
        get { return amountSet.median() ?? 0 }
    }
    static var min: Int {
        get { return amountSet.min() ?? 0 }
    }
}

struct Income {
    static var amountSet = [Int]()
    
    static var max: Int {
        get { if amountSet.count == 1 { return amountSet.first ?? 0 } else {
            return amountSet.max() ?? 0 }
        }
    }
    static var med: Int { if amountSet.count == 1 { return amountSet.first ?? 0 } else {
        return amountSet.median() ?? 0 }
    }
    
    static var min: Int { if amountSet.count == 1 { return amountSet.first ?? 0 } else {
        return amountSet.min() ?? 0 }
    }
}