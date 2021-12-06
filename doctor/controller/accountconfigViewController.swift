//
//  accountconfigViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class accountconfigViewController: UIViewController {
    var userviewmodelm = userVM()
    var user : User?
    @IBOutlet weak var number: UITextField!
    @IBAction func update(_ sender: Any) {
        
        userviewmodelm.updateuser(id: (userviewmodelm.userToken?._id)!, nom: name.text!, prenom: name.text!, email: (userviewmodelm.userToken?.email)!
                                  , password: (password.text)!, phone: number.text!, categorieclient: (userviewmodelm.userToken?.categorieclient)!)
        
        
    }
    
    @IBOutlet weak var conpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        name.text = userviewmodelm.userToken?.nom
        number.text = userviewmodelm.userToken?.phone
        
        
    }
    
   
    

  

}
