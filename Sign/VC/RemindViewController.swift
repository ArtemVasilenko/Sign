
import UIKit

class RemindViewController: UIViewController {
    var userRegistr = LoginAndPasswords()
    
    @IBOutlet weak var emailTxtRemember: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnRemind(_ sender: UIButton) {
        for remind in userRegistr.users {
            if remind.key == emailTxtRemember.text {
                print(remind.value)
            } else {
                print("not found")
            }
        }
    }
}
