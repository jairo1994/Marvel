
//
//  Session.swift
//  Flowes
//
//  Created by Jairo Lopez Gutierrez on 04/12/20.
//

import Foundation

class Session: NSObject{
    static let userProfile = "userMarvel"
    
    static var user: UserModel?{
        get{
            return try? UserDefaults.standard.customObject(forKey: Session.userProfile)
        }set{
            if let user = newValue{
                try? UserDefaults.standard.setCustomObject(user, forKey: Session.userProfile)
            }else{
                UserDefaults.standard.removeObject(forKey: Session.userProfile)
            }
        }
    }
}


public extension UserDefaults {
    
    private struct UserDefaultsError: Error {
        private let message: String
        init(_ message: String) {
            self.message = message
        }
        public var localizedDescription: String {
            return message
        }
    }
    
    func setCustomObject<T: Encodable>(_ object: T?, forKey key: String) throws {
        guard let object = object else {
        removeObject(forKey: key)
            return
        }
        do {
            let encoded = try PropertyListEncoder().encode(object)
            set(encoded , forKey:key)
        } catch {
            throw error
        }
    }

    func customObject<T: Decodable>(forKey key: String) throws -> T? {
        guard let data = data(forKey: key) else {
            return nil
        }
        return try PropertyListDecoder().decode(T.self, from: data)
    }
    
}
