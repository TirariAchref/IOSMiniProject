//
//  resetpasswordViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class resetpasswordViewController: UIViewController {

    @IBAction func `continue`(_ sender: UIButton) {
    }
    @IBOutlet weak var number: UIImageView!
    @IBOutlet weak var email: UIImageView!
    @IBOutlet weak var imageacchount: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageacchount.layer.borderWidth = 1
        imageacchount.layer.masksToBounds = false
        imageacchount.layer.borderColor = UIColor.black.cgColor
        imageacchount.layer.cornerRadius = imageacchount.frame.height/2
        imageacchount.clipsToBounds = true
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
