
import UIKit

class HelloViewController: UIViewController {
    var logoutBtn = UIButton()
    var userRegistr = LoginAndPasswords()
    var nameUser = RegistrationViewController()
    
    @IBOutlet weak var labelHello: UILabel!
    
    @IBOutlet weak var buttonLogout: UIButton!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogout.layer.cornerRadius = 5.0
    }
    
    fileprivate func tupLogoutButton() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signVC = storyBoard.instantiateViewController(withIdentifier: "signVC") as! SignViewController
        let navigationController = UINavigationController(rootViewController: signVC)
        self.present(navigationController, animated: true, completion: nil)
        signVC.userRegistr = self.userRegistr
    }
    
    @IBAction func buttonLogoutAction(_ sender: UIButton) {
        tupLogoutButton()
    }
}
