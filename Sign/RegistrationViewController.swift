import UIKit

class RegistrationViewController: UIViewController {
    
    var userRegistr = LoginAndPasswords()
    func addUsers (_ email: String, _ passw: String) {
        userRegistr.users[email] = passw
    }
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        txtName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = -75})
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = 0})
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func btnRegistration(_ sender: Any) {
        addUsers(txtEmail.text!, txtPassword.text!)
        print(userRegistr.users)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let login = segue.destination as! SignViewController
        login.users.users = userRegistr.users
    }
    
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtName {
            self.txtName.resignFirstResponder()
            return true
        }
        
        if textField == txtEmail {
            self.txtEmail.resignFirstResponder()
            return true
        }
        
        if textField == txtPassword {
            self.txtPassword.resignFirstResponder()
            return true
        }
        
        return false
    }
}
