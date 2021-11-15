//
//  OnBoardViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class OnBoardViewController: UIViewController {

    @IBOutlet weak var professional: UIImageView!
    @IBOutlet weak var user: UIImageView!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var conpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func register(_ sender: UIButton) {
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
