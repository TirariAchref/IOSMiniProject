//
//  donation2ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit
import Braintree



class donation2ViewController: UIViewController {
    
    
    
    
    
    
    var userviewmodelm = userVM()
   
    
   
    
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
    
    
    @IBAction func donate(_ sender: Any) {
        
        
      }
}
