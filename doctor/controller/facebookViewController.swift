//
//  facebookViewController.swift
//  doctor
//
//  Created by User on 01.01.2022.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class facebookViewController: UIViewController, LoginButtonDelegate {
    var strEmail : String?
    var strID : String?
    var strName : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let token = AccessToken.current, !token.isExpired {    //apell du token
        
        let token = token.tokenString                             // cast token
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",                            //reponse token email + name
                                                 parameters: ["fields": "email , name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        
        request.start { connection, result, error in
            
         
            self.strEmail = ((result! as AnyObject).value(forKey: "email") as? String) ?? ""
            self.strID = ((result! as AnyObject).value(forKey: "id") as? String) ?? ""
            self.strName = ((result! as AnyObject).value(forKey: "name") as? String) ?? ""
            print( self.strEmail!)
            
            print( self.strID!)
            
            print( self.strName!)
         
        }
            let loginButton = FBLoginButton()                                  //if resultat valide
            loginButton.center = view.center
            loginButton.delegate = self
            
            loginButton.permissions = ["public_profile", "email"]
            
            view.addSubview(loginButton)
        
    }else{
        let loginButton = FBLoginButton()                                  //if resultat valide
        loginButton.center = view.center
        loginButton.delegate = self
        
        loginButton.permissions = ["public_profile", "email"]
        
        view.addSubview(loginButton)
        
        
    }
    }
    

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
       
              let token = result?.token?.tokenString
              
              let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                       parameters: ["fields": "email , name"],
                                                       tokenString: token,
                                                       version: nil,
                                                       httpMethod: .get)
              
              request.start { connection, result, error in
                  self.strEmail = ((result! as AnyObject).value(forKey: "email") as? String) ?? ""
                  self.strID = ((result! as AnyObject).value(forKey: "id") as? String) ?? ""
                  self.strName = ((result! as AnyObject).value(forKey: "name") as? String) ?? ""
                  print( self.strEmail!)
                  
                  print( self.strID!)
                  
                  print( self.strName!)
                  self.performSegue(withIdentifier: "fb", sender: nil)
              
              }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
      return
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fb" {
            let destination = segue.destination as! navViewController
        
            destination.fb = true
            destination.email = strEmail
            destination.name = strName
            
        }
    }
}
