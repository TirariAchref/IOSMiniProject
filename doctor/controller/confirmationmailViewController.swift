//
//  confirmationmailViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class confirmationmailViewController: UIViewController {
    var randomInt : Int = 0
    var userviewmodelm = userVM()
    var email : String?
    var name : String?
    var password : String?
    var phone : String?
  

    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        randomInt   = Int.random(in: 1000..<9999)
        userviewmodelm.sendmail(email: (email)!, code: String(randomInt))
    }
 
   
    @IBAction func continu(_ sender: Any) {
        if code.text == String(randomInt){
            performSegue(withIdentifier: "pass", sender: sender)
        }else{
            prompt(title: "Error", message: "Code Incorrect !!!")
        }
       
    }
    func prompt(title: String, message: String) {
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
           
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
           
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pass" {
            let destination = segue.destination as! confirmationmailViewController2
            destination.userviewmodelm = userviewmodelm
            destination.email = email
            destination.name = name
            destination.password = password
            destination.phone = phone
            
        }
    }
    
}
