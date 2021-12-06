//
//  confirmationmailViewController2.swift
//  doctor
//
//  Created by achref on 14/11/2021.
//

import UIKit
import CoreData
class confirmationmailViewController2: UIViewController {
    var randomInt : Int = 0
    var userviewmodelm = userVM()
    var email : String?
    var name : String?
    var password : String?
    var phone : String?

    @IBOutlet weak var `continue`: UIButton!
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        randomInt   = Int.random(in: 1000..<9999)
        userviewmodelm.sendsms(code: String(randomInt))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let destination = segue.destination as! tabbarViewController
            destination.userviewmodelm = userviewmodelm
           
        }
    }

    @IBAction func cont(_ sender: Any) {
        if code.text == String(randomInt){
            userviewmodelm.createuser(nom: name!, prenom: name!, email: email!, password: password!, phone: phone!, categorieclient: "CLIENT",imageUrl: "profile")
            sleep(1)
            userviewmodelm.createtoken(email: email!, password: password!)
            sleep(1)
            self.insertToken(token: userviewmodelm.tokenString!)
            performSegue(withIdentifier: "login", sender: sender)
        }else{
            prompt(title: "Error", message: "Code Incorrect !!!")
        }
    }
    func prompt(title: String, message: String) {
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
           
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
           
       }
    
    
    func insertToken(token : String ){
        //recuperarion du notre appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        //description de l'entite
        let entityDescription = NSEntityDescription.entity(forEntityName: "Token", in: managedContext)
        
        //creation d'un nouveau object
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        //set value to object
        object.setValue(token, forKey: "id")
        //save data
        do{
            try managedContext.save( )
            print("token saved")
            
        }catch{
            print("token error")
        }
    }
    
    
    
}
