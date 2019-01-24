
import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = -200})
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = 0})
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
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
        // return NO to disallow editing.
        print("textFieldShouldBeginEditing = это я решаю, можно ли редактировать")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool  {
        
       
        if (emailTextField.text?.matches("[a-z]"))! {
            print("test")
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        //копия предыдущей функции
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //копия предыдущей функции
        // if implemented, called in place of textFieldDidEndEditing:
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        print("textField, вы ввели \(string)")
        //        // return NO to not change text
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


