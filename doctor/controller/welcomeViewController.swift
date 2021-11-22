//
//  welcomeViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class welcomeViewController: UIViewController {

    var userviewmodel = userVM()
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func login(_ sender: Any) {
        userviewmodel.createtoken(email: email.text!, password: password.text!)
    }
   
    
}
