//
//  loginDetail.swift
//  Sign
//
//  Created by Артем on 1/24/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import Foundation

struct LoginAndPasswords {
    var users = ["admin": "admin"]
    
    func validate(_ email: String, _ password: String) -> Bool{
        for login in users {
            if login.key == email && login.value == password {
                print("ohh la la")
                return true
            }else {
                print("login or password incorrect")
            }
        }
        return false
    }
    
    func checkEmail(email: String) -> Bool {
        if email.matches("[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}") {
            return true
        }
        return false
    }
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
