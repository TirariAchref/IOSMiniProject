//
//  navViewController.swift
//  doctor
//
//  Created by User on 01.01.2022.
//

import UIKit

class navViewController: UINavigationController {

    var email : String?
    var name : String?
    var fb = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = self.topViewController as! OnBoardViewController
      
        
             if(fb == true){
                 vc.emailfb = email
                 vc.namefb = name
                 vc.fb = fb
             }

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
