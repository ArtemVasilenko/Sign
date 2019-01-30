import UIKit

class RegistrationViewController: UIViewController {
    var userRegistr = LoginAndPasswords()
    func addUsers (_ email: String, _ passw: String) {
        userRegistr.users[email] = passw
    }
    
    @IBOutlet weak var registrButtonOutlet: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    func madeNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = -75})
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {nc in self.view.frame.origin.y = 0})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtEmail.resignFirstResponder()
        self.txtName.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
    }
    
    fileprivate func tupRegistrButton() {
        if (txtEmail.text?.matchesEmail())! {
            if (txtPassword.text?.matchesPassword())! {
//        if userRegistr.checkEmail(email: txtEmail.text!) {
//            if userRegistr.checkPassword(password: txtPassword.text!) {
//                addUsers(txtEmail.text!, txtPassword.text!)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let helloVC = storyBoard.instantiateViewController(withIdentifier: "helloVC") as! HelloViewController
                self.present(helloVC, animated: true, completion: nil)
                helloVC.userRegistr = self.userRegistr
                print(userRegistr.users)
                print("email correct")
                print("password correct")
            } else { print("password incorrect") }
        } else { print("email incorrect") }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
txtName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        madeNotifications()
        registrButtonOutlet.layer.cornerRadius = 5.0
        
    }
    
    @IBAction func registrButton(_ sender: UIButton) {
        tupRegistrButton()
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
