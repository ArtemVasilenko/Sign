
import UIKit

class HelloViewController: UIViewController {
    var logoutBtn = UIButton()
    var userRegistr = LoginAndPasswords()
    @IBOutlet weak var buttonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogout.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func buttonLogoutAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signVC = storyBoard.instantiateViewController(withIdentifier: "signVC") as! SignViewController
        self.present(signVC, animated: true, completion: nil)
        signVC.userRegistr = self.userRegistr
    }
}
