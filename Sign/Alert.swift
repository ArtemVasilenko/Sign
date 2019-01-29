
import Foundation
import UIKit

struct Alert {
    let allertController = UIAlertController(title: "Erorr", message: "Login or password incorrect", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: {(_) in })
    func alarm() {
        allertController.addAction(action)
        
    }
}


