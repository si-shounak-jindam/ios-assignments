//
//  RealmManager.swift
//  Messenger
//
//  Created by Shounak Jindam on 18/10/23.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    let realm = try! Realm()
    
    private init(){}
    
    func saveToRealm<T: Object>(_ object: T) {
        
        do {
            try realm.write {
                realm.add(object, update: .all)
            }
        } catch {
            print("error saving realm object", error.localizedDescription)
        }
    }
}
