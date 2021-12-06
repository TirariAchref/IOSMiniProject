//
//  newquestionViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class newquestionViewController: UIViewController {

    var userviewmodelm = userVM()
    var questionviewmodel = questionVM()

    
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var subject: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submit(_ sender: UIButton) {
        questionviewmodel.createquestion(description: question.text!, subject: subject.text!, idClient: (userviewmodelm.userToken?._id)!)
        prompt(title: "Succes", message: "Question added successfully")
    }
    
    func prompt(title: String, message: String) {
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
           
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
           
       }

}
