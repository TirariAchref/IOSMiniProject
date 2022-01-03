//
//  donation1ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation1ViewController: UIViewController {

    var userviewmodelm = userVM()
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pass"{
            let destination = segue.destination as! PayViewController
            destination.userviewmodelm = userviewmodelm
        }
    }

    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    
}
