//
//  newmailViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class newmailViewController: UIViewController {

    var userviewmodelm = userVM()
    var messagerieviewmodel = messagerieVM()
    @IBOutlet weak var submit: UIButton!
   
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var to: UITextField!

    @IBOutlet weak var message: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    @IBAction func submit(_ sender: Any) {
        messagerieviewmodel.createmessagerie(message: message.text!, object: subject.text!, from: (userviewmodelm.userToken?.email)!, to: to.text!)
        prompt(title: "Succes", message: "Question added successfully")
    }
    func prompt(title: String, message: String) {
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
           
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
           
       }

}
