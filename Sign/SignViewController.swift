
import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var users = LoginAndPasswords()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = -200})
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = 0})
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        users.validate(emailTextField.text!, passwordTextField.text!)
    }
    
    
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
}



extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}


extension SignViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool  {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool  {
        
//       if (emailTextField.text?.matches("[a-z]"))! {
//            print("test")
//            return true
//        }
//
//        emailTextField.text = "error"
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //копия предыдущей функции
        // if implemented, called in place of textFieldDidEndEditing:
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        for login in users.users {
//            if login.key == emailTextField.text {
//                print("oh la-la")
//                    return true
//            }
//        }
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //print("textField что-то очистили")
        // called when clear button pressed. return NO to ignore (no notifications)
        return true  //разрешает удалять текст
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            self.emailTextField.resignFirstResponder()
            return true
        }
        
        if textField == passwordTextField {
            self.passwordTextField.resignFirstResponder()
            return true
        }
        
        return false
    }
}


