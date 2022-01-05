//
//  donation1ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation1ViewController: UIViewController {

    var userviewmodelm = userVM()
    var eventviewmodel = eventVM()
    var data = [Event]()
    //
    @IBOutlet weak var moneyneed: UILabel!
    
    @IBOutlet weak var eventdesc: UILabel!
    
    @IBOutlet weak var moneyevent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventviewmodel.getOwnerToy(successHandler: {anomalyList in
                    self.data = anomalyList
            self.moneyneed.text = self.data[0].money
            self.eventdesc.text = self.data[0].description
            self.moneyevent.text = self.data[0].moneyreached
                }, errorHandler: {
                    print("errorororoor")
                })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pass"{
            let destination = segue.destination as! donation2ViewController
            destination.userviewmodelm = userviewmodelm
            destination.dataevent = data
        }
    }

    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    
}
