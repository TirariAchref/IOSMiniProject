//
//  LaunchViewController.swift
//  doctor
//
//  Created by achref on 7/11/2021.
//

import UIKit


class LaunchViewController: UIViewController {

    
    var userviewmodel = userVM()
    var alluser = [User]()
    var reponseviewmodel = reponseVM()
    var questionviewmodel = questionVM()
    var messagerieviewmodel = messagerieVM()
    var eventviewmodel = eventVM()
    
    @IBAction func start(_ sender: UIButton) {
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //get all user
       //userviewmodel.getallusers(Allusers: alluser)
        // alluser.forEach { user in print(user.email!) }
        
       // userviewmodel.createuser()
    //        //userviewmodel.updateuser()
      //  userviewmodel.deleteuser()
 //     userviewmodel.getallusers()
       // userviewmodel.createtoken(email: "achref@gmail.com", password: "123")
      
    }

    
    @IBAction func getstarted(_ sender: Any) {
      //  userviewmodel.userdata.forEach { user in print(user.email!) }
     //   print(userviewmodel.tokenString!)
        
    }
    
    

}
