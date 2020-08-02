//
//  Data Management.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 02.07.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation
import RealmSwift

final class DataManager {
    
    // MARK: - Create + Delete
    
    static func createEntry(_ input: Object) {
        realm.beginWrite()
        realm.add(input)
        do { try realm.commitWrite() }
        catch { print(error) }
        
        switch input {
        case is Entry:
            notificationCenter.post(
                name: .entryAddSuccess,
                object: nil
            )
        case is Category:
            notificationCenter.post(
                name: .categoryAddSuccess,
                object: nil
            )
        default:
            print("Somehow you managed to break it, congrats!")
        }
    }
    
    static func deleteEntry(_ input: Entry) {
        realm.beginWrite()
        realm.delete(input)
        do { try realm.commitWrite() }
        catch { print(error) }
        
        notificationCenter.post(
            name: .entryRemoveSuccess,
            object: nil
        )
    }
    
    // MARK: - Mapping for Overview Table + UUID
    
    static func mapCategories(from data: Results<Entry>) -> [Dictionary<String, Int>.Element] {
        let rawData = Array(data)
        var dict: [String:Int] = [:]
        
        rawData.forEach {
            if let current = dict[$0.category!] {
                dict[$0.category!] = current + $0.amount
            } else {
                dict[$0.category!] = $0.amount
            }
        }
        return dict.sorted { $0.value < $1.value }
    }
    
    static func generateId() -> String {
        return UUID().uuidString
    }
    
    static func search(searchTerm: String? = nil) -> Results<Entry> {
        return realm.objects(Entry.self)
            .filter("category contains [c] %@",
                    searchTerm ?? "")
            .sorted(byKeyPath: "amount",
                    ascending: false)
    }
    
    
    // MARK: - Migration Tools
    
    static func schemaVersion() -> UInt64 {
        let schemaVersionCheck = Realm.Configuration()
        var version: UInt64 = 0
        
        do {
            version = try schemaVersionAtURL(schemaVersionCheck.fileURL!) as UInt64
            print("Schema version: \(version).")
        } catch {
            print(error)
        }
        return version
    }
    
    static func migrateSchema(schema version: @escaping () -> UInt64 = schemaVersion) {
        let config = Realm.Configuration(
            schemaVersion: version(),
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < version() {  }
        })
        
        Realm.Configuration.defaultConfiguration = config
    }
    
}
