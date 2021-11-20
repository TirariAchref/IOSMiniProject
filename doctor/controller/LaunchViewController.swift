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
            //userviewmodel.updateuser()
      //  userviewmodel.deleteuser()
        eventviewmodel.deleteevent()
    }
    @IBAction func unwindtoLaunch1(segue:
                                   UIStoryboardSegue){
        
        print("back")
    }
    

    

}
