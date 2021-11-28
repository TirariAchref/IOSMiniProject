//
//  welcomeViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit
import CoreData
class welcomeViewController: UIViewController {

    var userviewmodel = userVM()
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "signup", sender: sender)
    }
    
    @IBAction func login(_ sender: Any) {
        userviewmodel.createtoken(email: email.text!, password: password.text!)
        sleep(1)
        self.insertToken(token: userviewmodel.tokenString!)
        performSegue(withIdentifier: "login", sender: sender)
    }
   
    
    @IBAction func forgetpass(_ sender: Any) {
        performSegue(withIdentifier: "find", sender: sender)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let destination = segue.destination as! tabbarViewController
            destination.userviewmodelm = userviewmodel
           
        }
    }
}
