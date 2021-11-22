//
//  settingViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class settingViewController: UIViewController{
    var userviewmodel = userVM()

    @IBOutlet weak var grandimage: UIImageView!
    @IBOutlet weak var profileimage: UIImageView!
   
    @IBAction func deconnixion(_ sender: Any) {
        print(userviewmodel.isAuthenticated)
        userviewmodel.signout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.borderWidth = 1
        profileimage.layer.masksToBounds = false
        profileimage.layer.borderColor = UIColor.black.cgColor
        profileimage.layer.cornerRadius = profileimage.frame.height/2
        profileimage.clipsToBounds = true
        
        grandimage.layer.borderWidth = 1
        grandimage.layer.masksToBounds = false
        grandimage.layer.borderColor = UIColor.black.cgColor
        grandimage.layer.cornerRadius = grandimage.frame.height/2
        grandimage.clipsToBounds = true
        // Do any additional setup after loading the view.
        userviewmodel.createtoken(email: "achref@gmail.com", password: "12345")
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "config"{
            let destination = segue.destination as! accountconfigViewController
            destination.userviewmodel = userviewmodel
     
            
        }
    }
}
