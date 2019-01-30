
import Foundation
import UIKit

struct Alert {
    //let allertController = UIAlertController(title: "Erorr", message: "Login or password incorrect", preferredStyle: .alert)
    //let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    func alarm() {
        let allertController = UIAlertController(title: "Erorr", message: "Login or password incorrect", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        allertController.addAction(action)
        
    }
}


