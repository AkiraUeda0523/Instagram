import UIKit
import Firebase
import SVProgressHUD


class MyCommentViewController: UIViewController {
    
    @IBOutlet weak var myCommentTextField: UITextField!
    
    
    @IBOutlet weak var myCommentButton: UIButton!
    
    var outputValue: PostData! = nil
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func sendMyCommentButton(_ sender: Any) {
        
        //       print("comment_DEBUG_PRINT: sendMyCommentButtonが押されました。")
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(outputValue.id).collection("comments").document()
        
        
        
        postRef.setData(["comment": self.myCommentTextField.text as Any,"name": Auth.auth().currentUser!.displayName])
        
        
        
        //SVProgressHUD.showSuccess(withStatus: self.myCommentTextField.text)
        
        //postRef.updateData(["commentdate": FieldValue.serverTimestamp()])
        
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
//        let storyboard: UIStoryboard = self.storyboard!
//        let Home = storyboard.instantiateViewController(withIdentifier: "Home")
        self.dismiss(animated: true, completion: nil)
//        self.present(Home, animated: true, completion: nil)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
