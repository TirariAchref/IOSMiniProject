//
//  donation2ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation2ViewController: UIViewController {
    var userviewmodelm = userVM()
    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    @IBOutlet weak var card: UITextField!
    @IBOutlet weak var money: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pass"{
            let destination = segue.destination as! donation3ViewController
            destination.userviewmodelm = userviewmodelm
        }
    }
  

}
