//
//  newmailViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class newmailViewController: UIViewController {

    @IBOutlet weak var profilepicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilepicture.layer.borderWidth = 1
        profilepicture.layer.masksToBounds = false
        profilepicture.layer.borderColor = UIColor.black.cgColor
        profilepicture.layer.cornerRadius = profilepicture.frame.height/2
        profilepicture.clipsToBounds = true
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
