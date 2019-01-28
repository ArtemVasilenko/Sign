//
//  loginDetail.swift
//  Sign
//
//  Created by Артем on 1/24/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import Foundation

struct LoginAndPasswords {
    var users = [String: String]()
    
    func validate (_ email: String, _ password: String){
        for login in users {
            if login.key == email && login.value == password {
                print("ohh la la")
            }else {
                print("login incorrect")
            }
        }
    }
}


