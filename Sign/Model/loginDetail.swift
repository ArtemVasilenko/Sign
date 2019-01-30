
import Foundation
import UIKit

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
    
}
    


extension String {
    func matchesEmail() -> Bool {
        return self.range(of: "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}", options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func matchesPassword() -> Bool {
        return self.range(of: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", options: .regularExpression, range: nil, locale: nil) != nil
    }
}
