
import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var btnRegistr: UIButton!
    
    var userRegistr = LoginAndPasswords()
    var alert = Alert()
    func createNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = -200})
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = 0})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        btnEnter.layer.cornerRadius = 5.0
        btnRegistr.layer.cornerRadius = 5.0
        createNotification()
    }
    
    
    @IBAction func enterButton(_ sender: UIButton) {
        if userRegistr.validate(emailTextField.text!, passwordTextField.text!) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let helloVC = storyboard.instantiateViewController(withIdentifier: "helloVC") as! HelloViewController
            self.present(helloVC, animated: true, completion: nil)
        } else {
            alert.alarm()
//            self.present(alert.allertController, animated: true, completion: nil)
            print("oh no")
        }
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
    }
}



extension SignViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool  {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool  {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
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


