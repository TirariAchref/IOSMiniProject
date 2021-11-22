//
//  accountconfigViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class accountconfigViewController: UIViewController {
    var userviewmodel = userVM()
    var user : User?
    @IBOutlet weak var number: UITextField!
    @IBAction func update(_ sender: Any) {
        
        userviewmodel.updateuser(id: (userviewmodel.userToken?._id)!, nom: name.text!, prenom: name.text!, email: (userviewmodel.userToken?.email)!
                                 , password: (userviewmodel.userToken?.password)!, phone: number.text!, categorieclient: (userviewmodel.userToken?.categorieclient)!)
        
        
    }
    
    @IBOutlet weak var conpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var profileimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.borderWidth = 1
        profileimage.layer.masksToBounds = false
        profileimage.layer.borderColor = UIColor.black.cgColor
        profileimage.layer.cornerRadius = profileimage.frame.height/2
        profileimage.clipsToBounds = true
        // Do any additional setup after loading the view.
        name.text = userviewmodel.userToken?.nom
        number.text = userviewmodel.userToken?.phone
     
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setting"{
            let destination = segue.destination as! settingViewController
            destination.userviewmodel = userviewmodel
     
            
        }
    }

  

}
