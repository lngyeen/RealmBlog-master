//
//  User.swift
//  RealmTodoApplicationNotificationStarter
//
//  Created by Ali Akhtar on 16/05/2019.
//  Copyright © 2019 Ali Akhtar. All rights reserved.
//

import Foundation
import RealmSwift

enum UserType: Int {
    case premium
    case gold
    case none
}

class User: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var userId = 0
    @objc dynamic var passport: Passport?
    @objc private dynamic var privateUserType: Int = UserType.none.rawValue
    let isEmailSubscriptionEnabled = RealmOptional<Bool>()
    let todos = List<Todo>()
    
    var isUserHasTodos: Bool {
        return todos.count > 0
    }
    
    var type: UserType {
        get { return UserType(rawValue: privateUserType)! }
        set { privateUserType = newValue.rawValue }
    }
    
    override class func indexedProperties() -> [String] {
        return ["userId", "firstName"]
    }
    
    override class func primaryKey() -> String? {
        return "userId"
    }
    
    convenience init(_ firstName: String, _ userId: Int) {
        self.init()
        self.firstName = firstName
        self.userId = userId
    }
}

