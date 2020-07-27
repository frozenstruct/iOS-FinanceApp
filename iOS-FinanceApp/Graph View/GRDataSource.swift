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
    let transmission = GRTransmission()
    
       
    func getTimeframeData(timeFrame: TimeFrame, input data: Results<Entry> = entries, cutOff: Date) {
        transmission.matchedEntries = entries.filter({ $0.date! >= cutOff })
        print(transmission.matchedEntries)
        
        Publisher.send(transmission)
    }
}
