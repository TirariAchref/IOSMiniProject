//
//  mailViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class mailViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

   //var
    var userviewmodelm = userVM()
    var messagerieviewmodel = messagerieVM()
    @IBOutlet weak var profileimage: UIImageView!
    
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var data = [Messagerie]()
    var filteredData = [Messagerie]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return filteredData.count //6 elements
       }
       
       
       
       
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           tableView.backgroundColor = UIColor(hex: 0xE6FAF0)
           let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
           let contentView = cell?.contentView
           
           let label = contentView?.viewWithTag(1) as! UILabel
           let text = contentView?.viewWithTag(3) as! UILabel
           let imageView = contentView?.viewWithTag(2) as! UIImageView
           
           imageView.layer.masksToBounds = false
           imageView.layer.borderColor = UIColor.black.cgColor
           imageView.layer.cornerRadius = imageView.frame.height/2
           imageView.clipsToBounds = true
           label.text = "From: "+filteredData[indexPath.row].from!
           text.text = filteredData[indexPath.row].message
           imageView.image = UIImage(named: "profile")
           
           
           
           return cell!
           
       }
       
     
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let movie = filteredData[indexPath.row]
           performSegue(withIdentifier: "mSegue", sender: movie)
           
       }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: Messagerie) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.from!.range(of: searchText, options: .caseInsensitive) != nil
        })

        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.borderWidth = 1
        profileimage.layer.masksToBounds = false
        profileimage.layer.borderColor = UIColor.black.cgColor
        profileimage.layer.cornerRadius = profileimage.frame.height/2
        profileimage.clipsToBounds = true
        // Do any additional setup after loading the view.
        profileimage.image = UIImage(named: (userviewmodelm.userToken?.imageUrl)!)
        messagerieviewmodel.getallmessageries()
        sleep(1)
        data = messagerieviewmodel.listmessagerie
        data.forEach{ msg in if(msg.from == userviewmodelm.userToken?.email || msg.to == userviewmodelm.userToken?.email ){self.filteredData.append(msg)} }
     data = filteredData
    }
    

    
   //action
    
    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "donateSegue", sender: sender)
    }
    
    @IBAction func newMessage(_ sender: Any) {
        performSegue(withIdentifier: "newMessege", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newMessege"{
            let destination = segue.destination as! newmailViewController
            destination.userviewmodelm = userviewmodelm
            
        }
        
    }
}
