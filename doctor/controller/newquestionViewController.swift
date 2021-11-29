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
    }
    
   

}
