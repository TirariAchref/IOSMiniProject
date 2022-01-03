//
//  PayViewController.swift
//  doctor
//
//  Created by samir on 03/01/2022.
//

import UIKit
import Braintree

// compte samir paypal busines
//
// sb-ei8lh10803981@business.example.com
// password
// s/X3N[<)


// tokenation key
// sandbox_7b2b5hqj_dtg5qdn6p39c3q9b
// secret key

// EMj4nd8l4Vg6EpuB_vFsUq4_cnbtepruwxp8pEErqbgSuHLti0yWe-1kcE_7kgKYA-n8YVqHnBPY6jC2

// sandbox account
// sb-ei8lh10803981@business.example.com
// client id
// AVG0bmX-MM640bmZMTiy22lP2C2h7UxTI1BIq5CV6jccbsBBi3dXHQkUgKSKCfip1Nr2XA5UyopzKU6U
class PayViewController: UIViewController {
    var userviewmodelm = userVM()
    // var
    // Seller paypal sandbox account
    // Email ID:
    // sb-ei8lh10803981@business.example.com
    // System Generated Password:
    // N!)=Fo0y
    
    // Buyer paypal sandbox account
    // Email ID:
    // sb-vl4gx10779533@personal.example.com
    // System Generated Password:
    // ATPK&bX2
    
    
    // Client ID
    // AbI0i6bDsTDEkvFvM4ehGv4Jr8JRGSNyjPn2vbeLcHwArrBzOgdv7DCMI8wy0Qdwk3Yg-Mu9DIH0YNm8
    // Secret
    // EF0rMMzmsEc6YwVnDzY4oHBbSK_QEc-Wdh-UQorQ2LtzlNCXlWvzxxcsiSuDnhKH-t1HBEEX3gBzKL3v
    
    // tokenation key
    // sandbox_pg55d7z8_vyn2xk6665bkpb5f
    
    // variables
    var user: User?
    var braintreeClient: BTAPIClient!
    var amount = "10"
    
    // outlet
    
    //

    @IBOutlet weak var instructorName: UILabel!
    //  @IBOutlet weak var instructorName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        braintreeClient = BTAPIClient(authorization: "sandbox_gpgsv2y8_twyv2x893jbftsnw")
       
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
    
    // action

    @IBAction func payAction(_ sender: Any) {
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self // Optional
        
        // Specify the transaction amount here. "2.32" is used in this example.
        let request = BTPayPalRequest(amount: amount)
        request.currencyCode = "USD" // Optional; see BTPayPalRequest.h for more options
        
        payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
                
                // Access additional information
                
                let email = tokenizedPayPalAccount.email
                
                /*let firstName = tokenizedPayPalAccount.firstName
                 let lastName = tokenizedPayPalAccount.lastName
                 let phone = tokenizedPayPalAccount.phone
                 See BTPostalAddress.h for details
                 let billingAddress = tokenizedPayPalAccount.billingAddress
                 let shippingAddress = tokenizedPayPalAccount.shippingAddress*/
                
                
                let message =
                "You have successfuly paid "
                + self.amount
                + " USD using the paypal account : "
                + email!
                
                self.present(Alert.makeActionAlert(titre: "Success", message:  message, action: UIAlertAction(title: "Proceed", style: .default, handler: { action in
                    self.navigationController?.popViewController(animated: true)
                })),animated: true)
            } else if let error = error {
                print(error)
            } else {
                // Buyer canceled payment approval
            }
        }
        
    }
    }
   
    extension PayViewController : BTViewControllerPresentingDelegate{
        func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
            
        }
        
        func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
            
        }
        
        
    }

    extension PayViewController : BTAppSwitchDelegate{
        func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
            
        }
        
        func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
            
        }
        
        func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
            
        }
        
        
    }


