//
//  UserDefaultsManager.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import Foundation

enum UserDefaultsKey: String {
    case name
    case userName
    case introduction
    case selectedImage
}

class UserDefaultsManager {
    
    private init() { }
    
    static let shared = UserDefaultsManager()
    
    let ud = UserDefaults.standard
    
    var userName: String {
        get {
            ud.string(forKey: UserDefaultsKey.userName.rawValue) ?? ""
        }
        set {
            ud.set(newValue, forKey: UserDefaultsKey.userName.rawValue)
        }
    }
    
    var name: String {
        get {
            ud.string(forKey: UserDefaultsKey.name.rawValue) ?? ""
        }
        set {
            ud.set(newValue, forKey: UserDefaultsKey.name.rawValue)
        }
    }
    
    var introduction: String {
        get {
            ud.string(forKey: UserDefaultsKey.introduction.rawValue) ?? ""
        }
        set {
            ud.set(newValue, forKey: UserDefaultsKey.introduction.rawValue)
        }
    }
    
}



